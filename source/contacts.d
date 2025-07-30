module contacts;

import std.typecons;

alias Option = Nullable;

public struct Contact {
	Option!string[] other_names;
	string[] phone_numbers;
}

public void add_contact(string name, string[] numbers,ref Contact[string] phone_book) {
	phone_book[name] = Contact(Option!string[].init, numbers);
}
public void rem_contact(string name, ref Contact[string] phone_book) {
	phone_book.remove(name);
}
