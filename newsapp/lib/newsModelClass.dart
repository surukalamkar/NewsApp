// class Newsmodelclass {
//   List<Article>? article;
//   String? status;
//   int? totalResults;

//   Newsmodelclass(Map<String, dynamic> jsondata) {
//     status = jsondata['status'];
//     totalResults = jsondata['totalResults'];
//     article = [];
//     if (jsondata['article'] != null) {
//       jsondata['article'].forEach((mapobject) {
//         Article obj = Article(mapobject);
//         article!.add(obj);
//       });
//     }
//   }
// }

// class Article {
//   Map<SourceData, dynamic>? sourcedata;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? publishedAt;
//   String? content;

//   Article(Map<String, dynamic> articlejsondata) {
//     author = articlejsondata['author'];
//     title = articlejsondata['title'];
//     description = articlejsondata['description'];
//     url = articlejsondata['url'];
//     publishedAt = articlejsondata['publishedAt'];
//     content = articlejsondata['content'];
//     sourcedata = {};
//     if (articlejsondata['sourcedata'] != null) {
//       if (articlejsondata['source'] != null) {
//         Map<String, dynamic> sourceDataMap = articlejsondata['source'];
//         SourceData sourceData = SourceData(
//           id: sourceDataMap['id'],
//           name: sourceDataMap['name'],

        
//         );
//        sourcedata!['SourceData'] = sourceData; 
//       }
//     }
//   }
// }

// class SourceData {
//   String? id;
//   String? name;
//   SourceData( {required this.name, required this.id});
// }





// class Newsmodelclass {
//   List<Article>? article;
//   String? status;
//   int? totalResults;

//   Newsmodelclass(Map<String, dynamic> jsondata) {
//     status = jsondata['status'];
//     totalResults = jsondata['totalResults'];
//     article = [];
//     if (jsondata['articles'] != null) {
//       jsondata['articles'].forEach((mapobject) {
//         Article obj = Article(mapobject);
//         article!.add(obj);
//       });
//     }
//   }
// }

// class Article {
//   Map<String, SourceData>? sourcedata; 
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? publishedAt;
//   String? content;

//   Article(Map<String, dynamic> articlejsondata) {
//     author = articlejsondata['author'];
//     title = articlejsondata['title'];
//     description = articlejsondata['description'];
//     url = articlejsondata['url'];
//     publishedAt = articlejsondata['publishedAt'];
//     content = articlejsondata['content'];


//     sourcedata = {};

//     if (articlejsondata['source'] != null) {
//       Map<String, dynamic> sourceDataMap = articlejsondata['source'];
//       SourceData sourceData = SourceData(
//         id: sourceDataMap['id'],
//         name: sourceDataMap['name'],
//       );
//       sourcedata!['SourceData'] = sourceData;  
//     }
//   }
// }

// class SourceData {
//   String? id;
//   String? name;

//   SourceData({required this.id, required this.name});
// }
