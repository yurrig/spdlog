setlocal
call %~dp0..\vc_setup.cmd
set BUILD=build
title Configuring spdlog
%CMAKE% -S . -B %BUILD%
title Building spdlog Debug
msbuild /m %BUILD%\spdlog.sln -p:Configuration=Debug
title Building spdlog Release
msbuild /m %BUILD%\spdlog.sln -p:Configuration=Release
title Done building spdlog
NuGet.exe pack spdlog.nuspec -OutputDirectory %PACKAGES%\nuget_packages
endlocal
