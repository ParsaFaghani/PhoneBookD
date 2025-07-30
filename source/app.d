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
				write("Enter Number: ");
				string number = readln().strip();
				add_contact(name, [number], phone_book);
				writeln("Contact add");
				break;
			case "3":
				write("Name: ");
				string name = readln().strip();
				write("Are you sure to remove this? Y/n: ");
				string yes = readln().strip();
				if (yes == "y" || yes == "Y" ) {
					rem_contact(name, phone_book);
				}
				break;
			case "0": return 0;
			default:
				writeln("Invalid Number");
		}
		
	}
	
}
