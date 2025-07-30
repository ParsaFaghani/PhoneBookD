import std.stdio;
import std.typecons;
import contacts;


void main()
{
	Contact[string] phone_book;

	add_contact("Ali", ["0922222222"], phone_book);
	rem_contact("Ali", phone_book);
	// phone_book["ali"] = Contact(Nullable!string[].init, ["09228224698", "09158939206"]);
	writeln(phone_book);
}
