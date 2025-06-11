Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C620C463
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629030; cv=none; b=OrRKz66JEISgwT4nYMPTQpkjY2aqnTfN6Dt2UxgqAUTFBE8vTkN8IljxVq1yXe16j5UgqiPtMfzx9eei5IcpyguWAnVj480kOe7foIe3pFGTIDZov67kHKtojnEtxSowOYzrr4ho6lycftLSNjfb/SLRLv72+GpcOD8fhLeWF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629030; c=relaxed/simple;
	bh=6ajor1B5tTDHU56MZ9Ugg0LYtwl5SvHnXqqwV6bNozc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i94nOMIY0kPB6UTmP50FNDK19nDbHaLsZ5u/0VhEQcqLG+b+fQTypPL42hg0R5eSAeV+nF7FWp9dAJNcqxt/X9C9e9Yml2gyCefAlGD7RB2Vsq7TyxxrgPBO3I8ifTeZGKHp09fUkCY9ltUEGSm1xQ44J3nlc4dKlvjFqiScHdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqYc6SC3; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqYc6SC3"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a42cb03673so79818261cf.3
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629028; x=1750233828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO0oOIhU9gTDAHfzv4bngGzr8nk9uJvKVCCgCMFOJ7s=;
        b=mqYc6SC3OhGUrb+dV/CjcpztQwHvvAp/zYKm88WUH20uwZIZYJ7C461+IuBWL52WMp
         U+hgJgk4dOE0BliEa6Uc7BeOBiWjl6EAWha1+pJznecGAbEZsweGUsZYpB+hPAX2XAgT
         RSXunRXMJg1+S8vwRZd9M/j1LH7o0h3J998ON8RiRRNYVV2QwP8V/vLtmn7LYNTleNMP
         qQjH0VK8ZN/athXKSe43KLLNlyuKxFWz6qzGFmPMqupxi9pT6sr8KDiebHG+Fb0wWQS0
         +joETdCTOQnaBHfEHrl6EBGBmewm7MVCuNIiUbDgXkpigDPqvrC0+hb0M9J4kd4rmGRi
         DE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629028; x=1750233828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO0oOIhU9gTDAHfzv4bngGzr8nk9uJvKVCCgCMFOJ7s=;
        b=KfrsjY0OhlbEDXH0advtNe4lXPhFzmRo+TxQeWpvPcw/96lfZELTP5H+e7LBis1XCo
         EV8vgw7XzelYCImfT5vExQLl99xabE3elClsPOMIW6ynbHgFnVHW1JXNmoozwGbBo9T7
         E3G/D8ZM7eXvbGt68lZclqLLUyUQaZ7o+yJ6RarKIMOcjIIMPMpbFzK6rOqJCt7TqlJL
         hT2ax3D6gHzmAQiGXG3ofje7hxLy1/m4dibG9psc5ltmH5yfv6pLeW1DC1tESDzW161Y
         EUBvygsP/50IJzBq2z1jfDDHYuljldK/WhyzJSFNJDlvnhCeT9JKExgxMij9xSyyODX4
         7DMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVPqluWV3KH5Ruhwf5tKgCPF78yQwECKWxO6ZuNfOCGGK80XU/5MBuNLKU8PnFxfUZ8+Z2zcw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjsTQtBm5ZFzoh9pty0BmRokp137v7ZgW8jlzcJYkH6o17me93
	9uRfMwSAsIcqRbYioaGhrdytUkWg1sDw/d+AheNu0JwUBK5Sq+m4o34O
X-Gm-Gg: ASbGncu4OKIY9hZr82XZQhMwEbCspeNTADJthzMo/PiG/p0+QUE80TVU1/SijBhD6C4
	x7fHzLG0bdmPH+zOYDDt1y8QdPsn1agmrhUwRpKoprlV3d2uD1WxSPPtvRTKVAH3ZZLlrJMvM34
	PaboC0hb0JzOAu/bHYDyjfjsMNuCd+YAHhChvs5VfVUk4t9KbnfXnmGRexgLrwAnHQNXYdD1LMW
	97Faw7sKeexpRTjED3vFH/80l1nNEmP39fdH3fu/OZVV+i2Y3QIQ/qu7gWeU+hxghMgWcGluNuu
	tTVvhYxM5RoYUA9WgquJDCKnYvFuMwLYNhZCag==
X-Google-Smtp-Source: AGHT+IG+DVPIIzWnmuIfybYPUVY9Wm0WTbrG5rT0kebswDgegdaXVZwVdvA8Qy8soVcQDTBv9EOxqA==
X-Received: by 2002:a05:622a:4249:b0:4a5:a96d:6068 with SMTP id d75a77b69052e-4a713c5871dmr47918471cf.37.1749629027868;
        Wed, 11 Jun 2025 01:03:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116ae58sm85983721cf.17.2025.06.11.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:47 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/2] riscv: dts: sophgo: Add mdio multiplexer for cv18xx
Date: Wed, 11 Jun 2025 16:01:58 +0800
Message-ID: <20250611080228.1166090-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mdio multiplexer support for CV18XX series SoC.

Inochi Amaoto (2):
  dt-bindings: net: Add Sophgo CV1800 MDIO multiplexer
  net: mdio-mux: Add MDIO mux driver for Sophgo CV1800 SoCs

 .../bindings/net/sophgo,cv1800b-mdio-mux.yaml |  47 +++++++
 drivers/net/mdio/Kconfig                      |  10 ++
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-mux-cv1800b.c           | 119 ++++++++++++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
 create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c

--
2.49.0

