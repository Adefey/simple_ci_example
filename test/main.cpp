/*Copyright 2022 Adefe*/

#include <gtest/gtest.h>
#include <lib_server.hpp>

TEST(ServerTest, TestEnabled) {
  Server server;
  EXPECT_EQ(server.IsEnabled(), true);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
