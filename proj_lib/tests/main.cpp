#include <iostream>
#include "proj_lib.h"
#include <gmock/gmock.h>
#include <gtest/gtest.h>

using ::testing::_;
using ::testing::InSequence;
using ::testing::Invoke;
using ::testing::Return;
using ::testing::UnorderedElementsAre;
using ::testing::UnorderedElementsAreArray;
using ::testing::AnyNumber;
using ::testing::AnyOf;

int main( int argc, char * argv[] )
{
  testing::InitGoogleTest( &argc, argv );
  return RUN_ALL_TESTS();
}

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
