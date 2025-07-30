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
    Contact[string] phone_book = load_contacts();

    while (true) {
        writeln("Choose an option:");
        writeln("1 - Print contacts");
        writeln("2 - Add contact");
        writeln("3 - Remove contact");
        writeln("0 - Exit");

        string input = readln().strip();
        ClearConsole();

        switch (input) {
            case "1":
                if (phone_book.length == 0) {
                    writeln("Phonebook is empty.");
                } else {
                    foreach (name, contact; phone_book){
                        writeln("Name: ", name);
                        foreach (number; contact.phone_numbers){
                            writeln("  Number: ", number);
                        }
                        writeln();
                    }
                }
                break;

            case "2":
                write("Name: ");
                string name = readln().strip();

                write("Enter number(s) separated by comma: ");
                string inputNumbers = readln().strip();
                string[] numbers = inputNumbers.split(",");

                foreach (i, ref n; numbers)
                    n = n.strip(); 

                add_contact(name, numbers, phone_book);
                writeln("Contact added.");
                break;

            case "3":
                write("Name: ");
                string name = readln().strip();

                if (name in phone_book) {
                    write("Are you sure to remove this? Y/n: ");
                    string yes = readln().strip();

                    if (yes == "y" || yes == "Y") {
                        rem_contact(name, phone_book);
                        writeln("Contact removed.");
                    } else {
                        writeln("Cancelled.");
                    }
                } else {
                    writeln("Contact not found.");
                }
                break;

            case "0":
                save_contacts(phone_book);
                writeln("Exiting and saving contacts...");
                return 0;

            default:
                writeln("Invalid option.");
        }

        save_contacts(phone_book);
        writeln();
    }
}