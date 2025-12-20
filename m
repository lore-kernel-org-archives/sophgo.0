Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9AD1EDA3C
	for <sophgo@lists.linux.dev>; Sat, 20 Dec 2025 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766234818; cv=none; b=pqo7y13SDRqGjELj/iLbZItwOQsfctHOFF279ZNfCHa/ah/sYiOWjafDpFmD5htPcB1ViOHhMQGPhYKaw91Kx9tMIsCoTp1iOSCKBmT2v+/u1DsNGIJpmboMBP5PG3G8fM0PMmpJz4vroOp4bx89SEZ0/zLBzAKdPaSd439a4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766234818; c=relaxed/simple;
	bh=BMqWG7tVLRpE0d5CCcucZYfHD30N453xL0DULNwoUjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh0SwQZFuMdn5F8nogtD1r+/rH/8FSr94wSB0rbWAyoZodrx1ycgedNX+GbbhGV0R52Gtx0vskpDLSTCXaYqiQsNW3sRfe36/XF295tMJvNj1SDBhWgs/zUAfS4kSEIqJNmi//nmicJCTjXoYcBBhbRlCKvoptZkMhwtfV8Y4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=nkiHhim1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nkiHhim1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c09bb78cso18163965ad.0
        for <sophgo@lists.linux.dev>; Sat, 20 Dec 2025 04:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766234814; x=1766839614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=nkiHhim1KVBfevHIgjSbpcz8m+zz9hr6XSaxSUfa9hFsUA7RYavTOwoOnriv0Il8cy
         5tM4AyEFQLkrMfBMbYPLS97Vt95FTQSx1HJeWPOjjmSRgG1ErdsFUy5VdUa0/UjXSdrQ
         rkcZbL4DAuPVRPcr0HhsxQZ8YaO5CDTKEwlPRgLBB1MJST3d58qOoxHzWtUDABPVEjqA
         LrtuCtpdw8nOpDhhVgMKyrcc7iHZgPw9FGctAEiV5M1Y92nTFb/X6JEJ270gedQuSDAY
         2jIH+Gh3V79SMdzYKPsp4pQypZcKA3OjNfdBKGoiyZDtr6dAwjCm7XFuBucYmLby26JO
         FgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766234814; x=1766839614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=Gz60hluaNOyEJyLlwpZoJSNDt9oQJ84FU8oWt8UQ7owZ59RamvZobhHcSnJs32Zlpp
         QWfI0qiAriExgwpyx9LTq1+IpxuJFVrpdgY2ZxtBgMoClSM3Fd/Pgg6j19ot1HXqeXdR
         c4YS7URvyBmsPt4wf2nhua3osAReWJGkgok9Xh0cNCUJWpKmKqn1PqnbqkUZcOXBWlFr
         smZVGimE4D10P8hyUj8dFn7Vm04+6Y3wc2O8ZuuOgPIg7KbYsdfqH0NiUuaWalYPMRLO
         gjUH/NqL6w++HHxEGFZGk529DUj68YqsIrfOxJBKobYj56kt0juopV+kXtCZCCzo5bD6
         xViA==
X-Forwarded-Encrypted: i=1; AJvYcCUt485o9i4NTBd1HN/eGyKsnl1497HDPFHQnN82qC6ptE/mlKhu7J42uzgKdI/8taT7ayfgNvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYgRvsUV3DOjU1xyTJdk/bOczXZsSuNqdfh3ZbaYdKltLB7Ryr
	EsthdjlD/nEDF2JXcsM/nx/o8O9ZqWivwCzVc5tWwe9+06kbMKYkZaooXWj92rHLTqV3dx3CYr8
	CxrzizoHrLzNH5h2zvo2it2nioDpe7NU=
X-Gm-Gg: AY/fxX61R3zW12psb0m6kf6M9JNEKFoCascIIuh7K22lTDw2A/a0DZgy80EBYg5Ooe6
	txjgg5kxGx5CffzgItZJ2KpX5wMG1E5mvt/ZRvbG0z8VgAW5JE3ht4LD2FzJgi0T5h4Obh/zVDm
	/x0wVEmndBoJX22WbF++mFPSsAKBDSXuWNe+m863zkFU1E4xaAjZWfZoIiiSkSrA5SoYUpxFVGK
	nLibcHWoqLv861AQ+Ad7MVQWpoF/D4ND48IYsNQTa88LcRiHOR269rurtggbfesy2RM6qKZUWHn
	fmJP1OA6xkAsAdT3yQmKqfAKMVLS6gRj2zhMC5Y=
X-Google-Smtp-Source: AGHT+IGTZVFXf6rAC1bEGZmO7YaQs0mj72/Bxua6dbMs1yZR8CidcfGRl/4LVrNe9mb+pBaCXI6UiiHmEjBYB9UahrA=
X-Received: by 2002:a17:903:198e:b0:2a0:99f7:67b4 with SMTP id
 d9443c01a7336-2a2f0cbc904mr55199135ad.8.1766234813931; Sat, 20 Dec 2025
 04:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com> <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Dec 2025 13:46:43 +0100
X-Gm-Features: AQt7F2qpxOToWQKPYlABMJwLqho0Xychdf9rQln23uKf9MMkpqj4U-v6YeXkrYo
Message-ID: <CAFBinCAXb87FKwA_=UEx5YTekevVUun1gieUfMux=oQAgjZS7w@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 12:42=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
Amlogic SoCs have up to one power domain, so for the Amlogic part:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
