using Engine.System;
using Engine.System.Utils;
using Engine.Graphics;


public static int main(string [] argv) {
  var application = new Engine.System.Application()
    .set_width(100)
    .set_height(200);

  application.on_run.connect((self) => {
    Console.write_line("Application.on_run");
  });

  application.on_draw.connect((self) => {
    Console.write_line("Application.on_draw");
  });

  application.on_exit.connect((self) => {
    Console.write_line("Application.on_exit");
  });

  application.run();

  var circle = new Circle()
    .set_fill_color("#E66B6B")
    .set_radius(30);

  return 0;
}