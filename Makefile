
ARCHIVE=details-for-nta

default: encrypt

$(ARCHIVE).zip: 
	zip -r $(ARCHIVE).zip $(ARCHIVE)/

.PHONY: encrypt	
encrypt: $(ARCHIVE).zip
	openssl aes-256-cbc -a -salt -in $(ARCHIVE).zip -out $(ARCHIVE).zip.bin

.PHONY: decrypt	
decrypt: $(ARCHIVE).zip
	openssl aes-256-cbc -d -a -salt -in $(ARCHIVE).zip.bin -out $(ARCHIVE).OUT.zip

.PHONY: clean
clean: 
	rm *.zip
	rm *.bin

