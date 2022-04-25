build:
	docker-compose build

run:
	docker-compose up -d

bash: run
	docker-compose exec codesign bash

help: 
	docker run -it --rm -v $(PWD)/entrypoint.sh:/entrypoint.sh --env-file .env codesign --help

credentials:
	docker run -it --rm -v $(PWD)/entrypoint.sh:/entrypoint.sh --env-file .env codesign get_credential_ids

sign: 
	docker run -it --rm -v $(PWD)/entrypoint.sh:/entrypoint.sh --env-file .env codesign sign -input_file_path=/codesign/examples/codesign.ps1 -output_dir_path=/codesign/output