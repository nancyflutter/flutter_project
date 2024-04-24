import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactBookAccess extends StatefulWidget {
  const ContactBookAccess({super.key});

  @override
  State<ContactBookAccess> createState() => _ContactBookAccessState();
}

class _ContactBookAccessState extends State<ContactBookAccess> {
  List<Contact> _contacts = const [];
  String? _text;

  bool _isLoading = false;

  final _ctrl = ScrollController();

  Future<void> loadContacts() async {
    try {
      await Permission.contacts.request();
      _isLoading = true;
      if (mounted) setState(() {});
      final sw = Stopwatch()..start();
      _contacts = await FastContacts.getAllContacts();
      sw.stop();
      _text = 'Contacts: ${_contacts.length}\nTook: ${sw.elapsedMilliseconds}ms';
    } on PlatformException catch (e) {
      _text = 'Failed to get contacts:\n${e.details}';
    } finally {
      _isLoading = false;
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: loadContacts,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isLoading ? const CircularProgressIndicator() : const Icon(Icons.refresh),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('Load contacts'),
              ],
            ),
          ),
          Text(_text ?? 'Tap to load contacts', textAlign: TextAlign.center),
          Expanded(
            child: Scrollbar(
              controller: _ctrl,
              interactive: true,
              thickness: 24,
              child: ListView.builder(
                controller: _ctrl,
                itemCount: _contacts.length,
                itemExtent: _ContactItem.height,
                itemBuilder: (_, index) => _ContactItem(contact: _contacts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  static const height = 86.0;

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final phones = contact.phones.map((e) => e.number).join(', ');
    final emails = contact.emails.map((e) => e.address).join(', ');

    return SizedBox(
      height: height,
      child: ListTile(
        leading: _ContactImage(contact: contact),
        title: Text(
          contact.displayName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (phones.isNotEmpty)
              Text(
                phones,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (emails.isNotEmpty)
              Text(
                emails,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}

class _ContactImage extends StatefulWidget {
  const _ContactImage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  __ContactImageState createState() => __ContactImageState();
}

class __ContactImageState extends State<_ContactImage> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) => SizedBox(
        width: 56,
        height: 56,
        child: snapshot.hasData ? Image.memory(snapshot.data!, gaplessPlayback: true) : const Icon(Icons.account_box_rounded),
      ),
    );
  }
}
