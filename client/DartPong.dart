#import('dart:html');

class DartPong {

  DartPong() {
  }

  void run() {
   
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartPong().run();
}
