# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"J101112","system":"readv2"},{"code":"J10y412","system":"readv2"},{"code":"J101113","system":"readv2"},{"code":"J10y411","system":"readv2"},{"code":"15054.0","system":"readv2"},{"code":"7104.0","system":"readv2"},{"code":"19470.0","system":"readv2"},{"code":"19111.0","system":"readv2"},{"code":"16605.0","system":"readv2"},{"code":"2535.0","system":"readv2"},{"code":"2281.0","system":"readv2"},{"code":"7577.0","system":"readv2"},{"code":"984.0","system":"readv2"},{"code":"25610.0","system":"readv2"},{"code":"1327.0","system":"readv2"},{"code":"K21","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('gastro-oesophageal-reflux-disease-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["gastrooesophageal---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["gastrooesophageal---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["gastrooesophageal---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
