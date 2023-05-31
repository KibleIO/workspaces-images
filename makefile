EXEC_THEMIS = Themis
LAUNCHER_THEMIS = launcher

kible-firefox-arm-publish: $(EXEC_THEMIS) $(EXEC_LIB_RANA) $(LAUNCHER_THEMIS)
	docker build --platform linux/arm64 --file dockerfile-kasm-firefox-arm -t kible/firefox:arm .
	docker login -u "kible" -p "eehKgVR4QmoED8" docker.io
	docker push kible/firefox:arm

kible-firefox-x86-publish: $(EXEC_THEMIS) $(EXEC_LIB_RANA) $(LAUNCHER_THEMIS)
	docker build --platform linux/amd64 --file dockerfile-kasm-firefox-x86 -t kible/firefox:x86 .
	docker login -u "kible" -p "eehKgVR4QmoED8" docker.io
	docker push kible/firefox:x86

kible-jammy-desktop-x86-publish: $(EXEC_THEMIS) $(EXEC_LIB_RANA) $(LAUNCHER_THEMIS)
	docker build --platform linux/amd64 --file dockerfile-kasm-ubuntu-jammy-desktop-x86 -t kible/jammydesktop:x86 .
	docker login -u "kible" -p "eehKgVR4QmoED8" docker.io
	docker push kible/jammydesktop:x86

$(EXEC_THEMIS):
	cp ../c-monorepo/src/kible.io/themis/Themis ./

$(LAUNCHER_THEMIS):
	cp ../c-monorepo/src/kible.io/themis/launcher ./