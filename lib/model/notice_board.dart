/*
 * Copyright (c) 2019.
 */
import 'database_helper.dart';

class NoticeBoard {
  final table_name = 'bien_bao';
  final int id;
  final String ten_loi;
  final int loai_xe;
  final String anh;
  NoticeBoard({this.id, this.ten_loi, this.loai_xe, this.anh});

  Future<List<NoticeBoard>> getAllRows() async {
    final database = new DatabaseHelper();
    print(database);
    final List<Map<String, dynamic>> result =
        await database.queryAllRows(table_name);

    return List.generate(result.length, (i) {
      return NoticeBoard(
        id: result[i]['id'],
        ten_loi: result[i]['ten_loi'],
        loai_xe: result[i]['loai_xe'],
        anh: result[i]['anh'],
      );
    });
  }
}
