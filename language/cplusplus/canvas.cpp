#include <gtkmm.h>

class HelloWorldWindow : public Gtk::ApplicationWindow {
public:
    HelloWorldWindow() {
        show_all();
    }
};

int main(int argc, char *argv[])
{
  auto app = Gtk::Application::create(argc, argv, "com.hello.world.HelloWorld");
  HelloWorldWindow window;
  window.set_title("Hello world!");
  return app->run(window);
}
