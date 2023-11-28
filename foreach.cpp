#include <hpx/execution.hpp>
#include <hpx/init.hpp>
#include <hpx/hpx_main.hpp>
#include <hpx/algorithm.hpp>
#include <hpx/modules/testing.hpp>

#include <string>
#include <vector>
#include <iterator>

#define BUF_SIZE 256

struct set_42 {
    std::size_t count = 0;
    template <typename T>
    void operator()(T& val)
    {
        ++count;
        val = T(42);
    }
};

int main() {
    std::vector<int> c(BUF_SIZE);

    for(int i = 0; i < BUF_SIZE; i++){
        c.push_back(getchar());
    }

    set_42 f;
    hpx::for_each(std::begin(c), std::end(c), f);

    // verify values
    std::size_t count = 0;
    std::for_each(std::begin(c), std::end(c), [&count](int v) -> void {
        HPX_TEST_EQ(v, int(42));
        ++count;
    });
    HPX_TEST_EQ(count, c.size());

    return 0;
}