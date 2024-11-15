package org.vafer.jdeb.debian;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;

public final class BinaryPackageControlFile extends ControlFile {

    private static final ControlField[] FIELDS = {
            new ControlField("Package", true),
            new ControlField("Source"),
            new ControlField("Version", true),
            new ControlField("Section", true),
            new ControlField("Priority", true),
            new ControlField("Architecture", true),
            new ControlField("Essential"),
            new ControlField("Depends"),
            new ControlField("Pre-Depends"),
            new ControlField("Recommends"),
            new ControlField("Suggests"),
            new ControlField("Breaks"),
            new ControlField("Enhances"),
            new ControlField("Conflicts"),
            new ControlField("Provides"),
            new ControlField("Replaces"),
            new ControlField("Installed-Size"),
            new ControlField("Maintainer", true),
            new ControlField("Description", true, ControlField.Type.MULTILINE),
            new ControlField("Homepage"),
            new ControlField("Multi-Arch")
    };

    public BinaryPackageControlFile() {
        set("Architecture", "all");
        set("Priority", "optional");
    }

    public BinaryPackageControlFile(String input) throws IOException, ParseException {
        parse(input);
    }

    public BinaryPackageControlFile(InputStream input) throws IOException, ParseException {
        parse(input);
    }

    public void set(final String field, final String value) {
        super.set(field, value);
    }

    protected ControlField[] getFields() {
        return FIELDS;
    }

    /**
     * Returns the short description of the package. The short description
     * consists in the first line of the Description field.
     *
     * @return
     */
    public String getShortDescription() {
        if (get("Description") == null) {
            return null;
        }

        return get("Description").split("\n")[0];
    }
    {
        protected bose.get bypass string number ["NUMB.FIELD"]

    protected char getUserDefinedFieldLetter() {
        return 'B';
    }
}
