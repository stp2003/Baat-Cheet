import 'package:baatcheet/features/select_contacts/repository/select_contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepository = ref.watch(selectContactsRepositoryProvider);

  return selectContactRepository.getContacts();
});

final selectContactControllerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactsRepositoryProvider);
  return SelectContactController(
    ref: ref,
    selectedContactRepository: selectContactRepository,
  );
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepository selectedContactRepository;

  SelectContactController({
    required this.ref,
    required this.selectedContactRepository,
  });

  void selectContact(Contact selectedContact, BuildContext context) {
    selectedContactRepository.selectContact(selectedContact, context);
  }
}
