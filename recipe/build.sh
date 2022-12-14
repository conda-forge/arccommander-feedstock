cd $SRC_DIR
dotnet tool restore
dotnet publish src/ArcCommander -c Release -p:UseAppHost=false
PREFIX=$(echo "${PREFIX}" | tr '\\' '/')
DOTNET_ROOT="${PREFIX}/lib/dotnet"
TOOL_ROOT=$DOTNET_ROOT/tools/arccommander
mkdir -p $PREFIX/bin $TOOL_ROOT
cp -r $SRC_DIR/src/ArcCommander/bin/Release/net6.0/* $TOOL_ROOT
cp "$RECIPE_DIR/arc.sh" "$PREFIX/bin/arc"
chmod +x "$PREFIX/bin/arc"
