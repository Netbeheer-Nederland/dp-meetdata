set dotenv-required
set dotenv-load
set shell := ["bash", "-uc"]
set windows-shell := ["bash", "-uc"]

_default:
    @just --list --justfile {{justfile()}}

# Generate everything
[group("generators")]
gen-all: clean gen-json-schema show-output

# Generate JSON Schema
[group("generators")]
gen-json-schema:
    @echo "Generating JSON Schema…"
    @echo -en "\t"
    mkdir -p "$DP_MEETDATA_SCHEMAS_DIR"/json_schema
    @echo -en "\t"
    linkml generate json-schema \
        --not-closed \
        "$DP_MEETDATA_SCHEMA" \
        > "$DP_MEETDATA_SCHEMAS_DIR/json_schema/$DP_MEETDATA_PROJECT_FILENAME.json_schema.json"
    @echo -n "… "
    @echo "OK."
    @echo
    @echo -e "Generated JSON Schema at: $DP_MEETDATA_SCHEMAS_DIR/json_schema/$DP_MEETDATA_PROJECT_FILENAME.json_schema.json"
    @echo

# Clean up the output directory
[group("general")]
clean:
    @echo "Cleaning up: $DP_MEETDATA_SCHEMAS_DIR"
    @if [ -d "$DP_MEETDATA_SCHEMAS_DIR" ]; then \
        ( shopt -s dotglob; rm -rf "$DP_MEETDATA_SCHEMAS_DIR"/* ); \
    else \
        mkdir "$DP_MEETDATA_SCHEMAS_DIR"; \
    fi
    @echo -n "… "
    @echo -e "OK."
    @echo "Cleaning up: $DP_MEETDATA_DOCS_IM_MODULE_DIR"
    @if [ -d "$DP_MEETDATA_DOCS_DIR" ]; then \
        ( shopt -s dotglob; rm -rf "$DP_MEETDATA_DOCS_IM_MODULE_DIR"/* ); \
    else \
        mkdir "$DP_MEETDATA_DOCS_IM_MODULE_DIR"; \
    fi
    @echo -n "… "
    @echo -e "OK."
    @echo

# Show the contents of the output directory
[group("general")]
show-output:
    @if [ -x "$(which tree)" ]; then \
        tree "$DP_MEETDATA_SCHEMAS_DIR"; \
    else \
        find "$DP_MEETDATA_SCHEMAS_DIR"; \
    fi

# Edit the information model
[group("schema")]
edit-schema:
    @${VISUAL:-${EDITOR:-nano}} "$DP_MEETDATA_SCHEMA"

# Show class hierarchy in information model
[group("schema")]
show-schema-classes:
    yq '.classes.* | key' "$DP_MEETDATA_SCHEMA"

# Show class hierarchy in information model
[group("schema")]
get-def uri:
    @yq '.classes.* | select(.class_uri == "{{uri}}")' "$DP_MEETDATA_SCHEMA"