import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://api.staging.customerlobby.com/graphql'),
  ),
);

final String loginMutation = """
  mutation login(\$email: String, \$password: String, \$fcmToken: String) {
    login(email: \$email, password: \$password, fcmToken: \$fcmToken) {
      authenticated
      token
      errors
      companyId
      companyUserId
      success
      firstName
      lastName
    }
  }""";

final String overallPerformanceReviewQuery = """
  query(\$companyId: ID!, \$dateFrom: String!, \$dateBucket: String!) {
    overallReviewPerformance(companyId: \$companyId, dateFrom: \$dateFrom, dateBucket: \$dateBucket) {
      data
      dateRanges
    }
  }""";
