using Engine.System;
using Engine.Graphics;
using Engine.System.Utils;


public static int main(string [] argv) {
  var application = new Engine.System.Application().setWidth(500).setHeight(300);

  application.onRun.connect((self) => {
    Console.writeLine("Application.onRun");
    Console.writeLine(@"$self");
  });

  application.onDraw.connect((self) => {
    Console.writeLine("Application.onDraw");
  });

  application.onExit.connect((self) => {
    Console.writeLine("Application.onExit");
  });

  application.run();

  return 0;
}