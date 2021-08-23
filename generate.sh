#!/bin/bash

rm -rf gen-cpp2

thrift1 --gen mstch_cpp2 Example.thrift
../built_thrift/thrift1_v2021.07.20.00 --gen mstch_cpp2 -out gen-v2021.07.20.00 Example.thrift
../built_thrift/thrift1_v2021.07.22.00 --gen mstch_cpp2 -out gen-v2021.07.22.00 Example.thrift
../built_thrift/thrift1_v2021.08.02.00 --gen mstch_cpp2 -out gen-v2021.08.02.00 Example.thrift
