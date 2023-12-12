const signInLink = document.querySelector(".sign-in > a");

if (signInLink && signInLink.dataset.redirect === "false") {
  const signInURL = signInLink.href;

  const modalSignInURL = Liferay.Util.addParams(
    "windowState=exclusive",
    signInURL
  );

  const setModalContent = function (html) {
    const modalBody = document.querySelector(".liferay-modal-body");

    if (modalBody) {
      const fragment = document.createRange().createContextualFragment(html);

      modalBody.innerHTML = "";

      modalBody.appendChild(fragment);
    }
  };

  let loading = false;
  let redirect = false;
  let html = "";
  let modalOpen = false;

  const fetchModalSignIn = function () {
    if (loading || html) {
      return;
    }

    loading = true;

    Liferay.Util.fetch(modalSignInURL)
      .then(function (response) {
        return response.text();
      })
      .then(function (response) {
        loading = false;

        if (!response) {
          redirect = true;

          return;
        }

        html = response;

        if (modalOpen) {
          setModalContent(response);
        }
      })
      .catch(function () {
        redirect = true;
      });
  };

  signInLink.addEventListener("mouseover", fetchModalSignIn);
  signInLink.addEventListener("focus", fetchModalSignIn);

  signInLink.addEventListener("click", function (event) {
    event.preventDefault();

    if (redirect) {
      Liferay.Util.navigate(signInURL);

      return;
    }

    Liferay.Util.openModal({
      bodyHTML: html ? html : '<span class="loading-animation">',
      height: "400px",
      onClose: function () {
        loading = false;
        redirect = false;
        html = "";
        modalOpen = false;
      },
      onOpen: function () {
        modalOpen = true;

        if (html && document.querySelector(".loading-animation")) {
          setModalContent(html);
        }
      },
      title: "Sign In",
    });
  });
}
