using Engine.System;
using Engine.Graphics;
using Engine.System.Utils;


public static int main(string [] argv) {
  var application = new Engine.System.Application().setWidth(500).setHeight(300);

  application.on_run.connect((self) => {
    Console.writeLine("Application.onRun");
    Console.writeLine(@"$self");
  });

  application.on_draw.connect((self) => {
    Console.writeLine("Application.on_draw");
  });

  application.on_exit.connect((self) => {
    Console.writeLine("Application.on_exit");
  });

  application.run();

  return 0;
}