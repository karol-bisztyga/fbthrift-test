#pragma once

#include "../gen-cpp2/KarolService.h"

class KarolService : virtual public cpp2::KarolServiceSvIf {
 public:
  void ping() override;
};
