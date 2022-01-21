import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty/src/source.dart';

class Repository {
  final GraphQLClient _client = GraphQLClient(
    link: Source.httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
  );

  Future<QueryResult> getResult(int page) async {
    final QueryOptions options = QueryOptions(
      document: gql(Source.fetchAllCharactersGraphQl),
      variables: <String, dynamic>{
        'page': page,
      },
    );
    final QueryResult result = await _client.query(options);

    return result;
  }
}
