module contacts;

import std.typecons;
import std.stdio;
import std.file;
import std.json;
import std.conv;
import std.array;

alias Option = Nullable;

public struct Contact {
    Option!string[] other_names;
    string[] phone_numbers;
}

public void add_contact(string name, string[] numbers, ref Contact[string] phone_book) {
    phone_book[name] = Contact(Option!string[].init, numbers);
}

public void rem_contact(string name, ref Contact[string] phone_book) {
    phone_book.remove(name);
}

public void save_contacts(Contact[string] phone_book) {
    JSONValue[] jsonContacts;

    foreach (name, contact; phone_book) {
        auto jsonContact = JSONValue([
            "name": JSONValue(name),
            "phone_numbers": JSONValue(contact.phone_numbers)
        ]);
        jsonContacts ~= jsonContact;
    }

    auto jsonArray = JSONValue(jsonContacts);
    std.file.write("data.json", jsonArray.toString());
}

public Contact[string] load_contacts() {
    Contact[string] phone_book;

    if (!exists("data.json"))
        return phone_book;

    string content = readText("data.json");
    auto parsed = parseJSON(content);

    foreach (entry; parsed.array) {
        string name = entry["name"].str;
        string[] phone_numbers;

        foreach (num; entry["phone_numbers"].array)
            phone_numbers ~= num.str;

        phone_book[name] = Contact(Nullable!string[].init, phone_numbers);
    }

    return phone_book;
}