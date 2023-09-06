package com.kalaazu.server.commands.out;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Menu bar command.
 * =================
 * <p>
 * Sends the different menu bar items.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuBarCommand extends OutCommand {
    private final short id = 11623;

    private List<ClientUiMenuBarCommand> items;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(items.size());
        items.forEach(i -> i.write(packet));
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class UpdateWindowItemCommand extends ClientUiMenuBarCommand.ClientUiMenuBarItemCommand {
        private final short id = 14317;

        private int height;
        private Boolean maximized;
        private int width;
        private String title;
        private int y;
        private ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand helpText;
        private int x;

        public UpdateWindowItemCommand(boolean maximized, int height, boolean visible, int y, int x, ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand toolTip, String title, int width, ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand helpText, String itemId)
        {
            this.title = title;
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            this.maximized = maximized;
            this.helpText = helpText;

            super.setVisible(visible);
            super.setItemId(itemId);
            super.setToolTip(toolTip);
        }

        public void write(Packet packet) {
            packet.writeShort(id);

            super.write(packet);
            packet.writeInt(this.height >> 14 | this.height << 18);
            packet.writeBoolean(this.maximized);
            packet.writeInt(this.width >> 2 | this.width << 30);
            packet.writeString(this.title);
            packet.writeShort(3358);
            packet.writeInt(this.y << 14 | this.y >> 18);
            this.helpText.write(packet);
            packet.writeInt(this.x >> 12 | this.x << 20);
        }
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class ClientUiMenuBarCommand extends OutCommand {
        public static final short NOT_ASSIGNED = 0;
        public static final short GENERIC_FEATURE_BAR = 2;
        public static final short GAME_FEATURE_BAR = 1;

        private final short id = 21788;

        private String position = "";
        private short menuId = 0;
        private List<ClientUiMenuBarItemCommand> menuBarItems;
        private String layoutId = "";

        @Override
        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeShort(this.menuId);
            packet.writeString(this.layoutId);
            packet.writeString(this.position);
            packet.writeInt(this.menuBarItems.size());
            menuBarItems.forEach(i -> i.write(packet));
        }

        @EqualsAndHashCode(callSuper = true)
        @AllArgsConstructor
        @NoArgsConstructor
        @Data
        public static class ClientUiMenuBarItemCommand extends OutCommand {
            private final short id = 11362;

            private String itemId = "";
            private boolean visible = false;
            private ClientUiTooltipsCommand toolTip;

            @Override
            public void write(Packet packet) {
                packet.writeShort(id);

                this.toolTip.write(packet);
                packet.writeString(this.itemId);
                packet.writeBoolean(this.visible);
            }

            @EqualsAndHashCode(callSuper = true)
            @Data
            @NoArgsConstructor
            @AllArgsConstructor
            public static class ClientUiTooltipsCommand extends OutCommand {
                private final short id = 11246;

                private List<ClientUiTooltipCommand> tooltips;

                @Override
                public void write(Packet packet) {
                    packet.writeShort(id);

                    packet.writeInt(this.tooltips.size());
                    tooltips.forEach(t -> t.write(packet));
                    packet.writeShort(-21605);
                }

                @EqualsAndHashCode(callSuper = true)
                @Data
                @AllArgsConstructor
                @NoArgsConstructor
                public static class ClientUiTooltipCommand extends OutCommand {
                    public static final short STANDARD = 0;
                    public static final short RED = 1;

                    private final short id = 11246;

                    private short color = 0;
                    private ClientUITooltipTextFormatCommand textFormat;
                    private List<ClientUITextReplacementCommand> textReplacements;
                    private String baseKey = "";

                    @Override
                    public void write(Packet packet) {
                        packet.writeShort(id);

                        packet.writeShort(31585);
                        packet.writeShort(this.color);
                        packet.writeString(this.baseKey);
                        textFormat.write(packet);
                        packet.writeInt(this.textReplacements.size());
                        textReplacements.forEach(t -> t.write(packet));
                        packet.writeShort(30300);
                    }

                    @EqualsAndHashCode(callSuper = true)
                    @Data
                    @AllArgsConstructor
                    @NoArgsConstructor
                    public static class ClientUITooltipTextFormatCommand extends OutCommand {
                        public static final short const_1089 = 3;
                        public static final short const_234 = 7;
                        public static final short const_1964 = 6;
                        public static final short LOCALIZED = 5;
                        public static final short PLAIN = 0;
                        public static final short const_2514 = 1;
                        public static final short const_2280 = 2;
                        public static final short const_2046 = 4;

                        private final short id = 24892;

                        private short format = 0;

                        @Override
                        public void write(Packet packet) {
                            packet.writeShort(id);

                            packet.writeShort(format);
                            packet.writeShort(26386);
                        }
                    }

                    @EqualsAndHashCode(callSuper = true)
                    @Data
                    @AllArgsConstructor
                    @NoArgsConstructor
                    public static class ClientUITextReplacementCommand extends OutCommand {
                        private final short id = 1059;

                        private String replacement = "";
                        private String wildcard = "";
                        private ClientUITooltipTextFormatCommand tooltipTextFormat;

                        @Override
                        public void write(Packet packet) {
                            packet.writeShort(id);

                            packet.writeString(this.replacement);
                            tooltipTextFormat.write(packet);
                            packet.writeShort(28496);
                            packet.writeString(this.wildcard);
                        }
                    }
                }
            }
        }
    }
}
