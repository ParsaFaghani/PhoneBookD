import std.stdio;
import std.typecons;
import contacts;
import std.conv;
import core.stdc.stdlib;
import std.string;


void ClearConsole() {
	version (Windows)
		system("cls");
	else
		system("clear");

}

int main()
{
	Contact[string] phone_book;

	while (true) {
		writeln("choose a option:");
		writeln("1 -print contacts.");
		writeln("2 -add contact");
		writeln("3 -remmove contact");
		writeln("0 -exit");
		string input = readln().strip();
		ClearConsole();
		switch (input) {
			case "1": 
				foreach (name, numbers; phone_book){
					writeln("name: " ~ name);
					writeln("numbers: ", numbers);
				}
				break;
			case "2":
				write("Name: ");
				string name = readln().strip();
				write("\nEnter Number: ");
				string number = readln().strip();
				add_contact(name, [number], phone_book);
				writeln("\n Contact add");
				break;
			case "0": return 0;
			default:
				writeln("Invalid Number");
		}
		
	}
	add_contact("Ali", ["0922222222"], phone_book);
	rem_contact("Ali", phone_book);
	// phone_book["ali"] = Contact(Nullable!string[].init, ["09228224698", "09158939206"]);
	writeln(phone_book);
}
