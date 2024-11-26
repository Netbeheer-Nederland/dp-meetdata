# config.public.mk

# This file is public in git. No sensitive info allowed.
# These variables are sourced in Makefile, following make-file conventions.
# Be aware that this file does not follow python or bash conventions, so may appear a little unfamiliar.

###### schema definition variables, used by makefile

# Note: makefile variables should not be quoted, as makefile handles quoting differently than bash
LINKML_SCHEMA_NAME=dp_meetdata
LINKML_SCHEMA_AUTHOR=Ritger Teunissen <ritger.teunissen@alliander.com>
LINKML_SCHEMA_DESCRIPTION=Information model for the "meetdata" data product.
LINKML_SCHEMA_SOURCE_PATH=src/dp_meetdata/schema/dp_meetdata.yaml
LINKML_SCHEMA_GOOGLE_SHEET_ID=1wVoaiFg47aT9YWNeRfTZ8tYHN8s8PAuDx5i2HUcDpvQ
LINKML_SCHEMA_GOOGLE_SHEET_TABS=personinfo enums

###### linkml generator variables, used by makefile

## gen-project configuration file
LINKML_GENERATORS_CONFIG_YAML= --config-file config.yaml --include jsonschema

## pass args if gendoc ignores config.yaml (i.e. --no-mergeimports)
LINKML_GENERATORS_DOC_ARGS= --no-hierarchical-class-view

## pass args to workaround genowl rdfs config bug (linkml#1453)
##   (i.e. --no-type-objects --no-metaclasses --metadata-profile rdfs)
LINKML_GENERATORS_OWL_ARGS=

## pass args to trigger experimental java/typescript generation
LINKML_GENERATORS_JAVA_ARGS=
LINKML_GENERATORS_TYPESCRIPT_ARGS=

