Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C76267733
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524004; cv=none; b=HomZDyZyvODJBsAAQvO2K2KQlMotJQDH1RldHSDeKBbxiZP6BiCpzSH5t97bf4i1u3l5ZMqqazKrg4KEm6DxbKBxqRHLC3dFbq12JHr9hL7A63SRqSk/JE7XfC0C7BcQvADRt43iiSWXC4z356z7cAahr0AQf46P/fZSBBsWVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524004; c=relaxed/simple;
	bh=pB4UnMehzDghVR5OwDqwfddSZnWmBw/uJ1d6JAmYPSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUk0k8gAbFl34jT6RLBd7BiC7gfzwEiMFz7aF07YUDgn1/6juzXYrmzGHZrGD3cuJkHwtsjInOpJUp1bKTAC6Bm2ttmx6v7L/iedoXOxmxbiguM5IHhwtWK/TCyhSXO3uD8uQLAOXWK1D0aYT3i4aGyI/6tMtP6GxulMySrQl78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsVotVU5; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsVotVU5"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8efefec89so54659056d6.3
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524001; x=1747128801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
        b=QsVotVU5PijOgYZhr9LrNH8MljS0fEwR+Nh0AUJnlu5WYZGIh0+/Eb9KPKlxqBjdm4
         UaKnLoZjFdu2Cz2TB3nfIG15OvVc4R/U8XFFnskaPlbJRLorY92Nz82lBYILicdrPm99
         I6kO9qADMFjNI8ig3mO927sWXTMnWteZw0k7Cgxqo5G4s3V3G824qTma94ih5AVe3QNn
         Z/ew0y1Yt1s0cLXA8YYzs85q+7iNICoUr1e3PyECr3v2mBl4b23gm24M2W2QwqttZIHv
         tWEY5l4HDEOIu7sQ5827snwfDcd2V6jba2eGHKgZCPLu6s/Mh+zEGP3R+gFf6zZZ4gSF
         Pnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524001; x=1747128801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
        b=TB9zrJEsxDbyQXnwq4YXoeDA0HP6gA10GvcXOw3FZDX/YOB2NqGueSpL7w3hhoZiQ6
         ieCxpRWVIHue3UFb4+DCoc/pK9E33xYrhEMZpDU/fKlK6R1cMN5heGns41wei4929rr1
         uqfqHS8ILIzIlJ32ZatBMJp2E19Fw5TxFXgFtczi9RApfu6H7n+9pGFyKz+d8T4tXrwL
         uZ2pqktAAKIsv05rsOP7WaLMS562yq/vvxT9lrHG1G44YdlQw0jQpvo/Q5HbE7HfPIlB
         l0lgGZoHLzxQ3kbD0pKC8j05QUcafnK714XkIsfev94bPNIiaMZgcGsXet8p1XOmfY2H
         0r0A==
X-Forwarded-Encrypted: i=1; AJvYcCXxeMiHgW+d3JT+jBsCH4oqPjbTf8wCGl/nj94hlNTREqDz0x6vuVEzldfzCLZfUe9Km9ZGoQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiBieJA9slVse7o7j8xYJ+D40HXnoeNiHnIxnK+0MOznQcj4Ao
	cRlWkXk9H3yeSkAvXDUeOMemrT0MkWqfX3YBqK8xi5Vzot1OJRjV
X-Gm-Gg: ASbGncvauWrS7a/rdV7n+md/s9gP31PcdPmixGHwW62KMkRSuqM5SM1ln/sPqCEbj+E
	hYQToQ2KDu975hKhoc6/exAl8ax6YI+JC05rE0Um5xHyhynVMePTG2PIIWp2bVjGipvj/bAFI6V
	O656oYQD/xFoe8wn9OZDihuO81pXSegKVlOsYA7gZEI0Y/HJ1IocZvCThv+GuB86DBtUUjAC3wE
	1X8U/MwXHbQA9xl0bfB5+N13FDJdcon8WLT9NSEXmKzaVVQUZrU7B/uCV15COZzH0K2ZuUm9Oe0
	46977pgSCI5ZAw99
X-Google-Smtp-Source: AGHT+IG0tpbViwqp9IJzfEAZpGJYiDuvgoMTMj0cgQ10I3tT7p2nWJKoF5IKgXDVmrvJ8d3QbJqUDQ==
X-Received: by 2002:a05:6214:20a3:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f51574c329mr249376586d6.13.1746524001422;
        Tue, 06 May 2025 02:33:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f538316c12sm6219536d6.0.2025.05.06.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for SG2042
Date: Tue,  6 May 2025 17:32:50 +0800
Message-ID: <20250506093256.1107770-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 x4 evb board, as pioneer
does not expose this device.

Inochi Amaoto (4):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
  riscv: dts: sophgo: add ethernet GMAC device for sg2042

 .../devicetree/bindings/net/snps,dwmac.yaml   |  4 ++
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 11 +++-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 62 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 5 files changed, 76 insertions(+), 3 deletions(-)

--
2.49.0

