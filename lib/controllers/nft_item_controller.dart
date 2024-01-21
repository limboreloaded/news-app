import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNftItemNotifier extends FamilyAsyncNotifier<NftsModel, String> {
  @override
  Future<NftsModel> build(String arg) async {
    final nftEntry = await _fetchNftEntry(arg);

    return nftEntry;
  }

  Future<NftsModel> _fetchNftEntry(String id) async {
    final db = ref.read(AppDatabase.provider);

    final nftEntry = await db.getNftItem(id);

    NftsModel savedEntry = NftsModel.fromTable(nftEntry);

    return savedEntry;
  }
}

final nftItemFamily =
    AsyncNotifierProviderFamily<AsyncNftItemNotifier, NftsModel, String>(() {
  return AsyncNftItemNotifier();
});
