#include "proj_lib.h"
#include <gmock/gmock.h>
#include <gtest/gtest.h>

struct TestData {
    int Data, Expected;
};

class ArithmeticsTest
  : public ::testing::WithParamInterface<TestData>, public ::testing::Test {
};

INSTANTIATE_TEST_CASE_P(ArithmeticsTestParams, ArithmeticsTest, ::testing::Values(
   TestData({5, 25}), TestData({10, 100}), TestData({-1, 1})
));

TEST_P(ArithmeticsTest, ArithmeticsTestCall) {
  TestData param = GetParam();
  int res = SomeArithmetics(param.Data);
  EXPECT_EQ(res, param.Expected);
};
