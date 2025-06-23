Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9C1078F
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 00:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638660; cv=none; b=fuZLM1eT3ydc5ZPrSbskxKCo56lR6yZtjY4vSol3Cwf2DJdQgrv1fad8fqy8oqH9d0zR9+JRGF0Gt6KnfoxEYrqcbCf6BCDKPUdYu3tCj8O7PoopAZr6NTORPSyeZjssXTM8OUDlGYdCPzDLIVUe7UoOR3hvsrFD1FxYcYYXmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638660; c=relaxed/simple;
	bh=3J9d4REFKBDwJnziIZAxTparxDIgPbaqYezCh3xpY6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1/HnIUZ/ZVXeyaGnlgVJg36EU+hw6etnxjrI0k3Tv6WvJoqbm3pqfTpSdK/k42Kg39bYE4vy7Z3C6twOY2Sj0DqJDIKr3vKTCQP92QLYE0uSrH2kIDpaPES4zzS4qSatQQn15W5i39NGAxi2nw4NTFc5pWH4ENKlEGa/YgSVh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwR30myP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwR30myP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4073778b3a.2
        for <sophgo@lists.linux.dev>; Sun, 22 Jun 2025 17:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638658; x=1751243458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iljGygD1Q6d7ScReIDOoZWXtLgtOIhYkJ6hRy1R+TEY=;
        b=mwR30myPIaqJX5jWAu4YgQfllflcilNm3Q5p3f6MjFgOtIUbzususct+12X2iMIDk7
         o/xjcnk1IkNu2qPrxhOcNpjBw2ewsOc2w9D9cgfGepys4EYdYvEl57PceuBocsGVfIBY
         0nLcMi82qnxJfQ5Rw9MHtjGZCj7aggbyWQQhw06HxkYauqz3w2AtzlvLgUkpOYPwk8eL
         Nnyi7FM79r5HRiTdSe+MGgce95PtGfE369EEs1xxMfJ6v0Uzo7lFkXbNZvyOBADbpWc/
         IURCeM9Sga9ZkioOXdVkudP5QodLVUoPO7lYQvzF7aYlaWxkLWzcV0fdx3H1Q84RwB1j
         gUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638658; x=1751243458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iljGygD1Q6d7ScReIDOoZWXtLgtOIhYkJ6hRy1R+TEY=;
        b=hLFkPYZZjj2Q2M61ygdEmDGFul2dvocBFBIZqOrXLTB2725JbSzI3FAu6hyNCQcKcy
         1cxNCQ6KhTDrCnhm+ejZuyktNVygUgESLMStt6lI+wlBJtfjGRDTgqDbYkqdVItm9EJC
         qGdHBdO0UUtpPE3BRMbc6CHm196OF7VgiJcDfxCTutRShdJIjb0yBG82BRbTilOb8AfK
         F+lLSa1YArh9AyaZwORp0Do+Vz4xMeSQ2GHTwH2U/m5W1mTEgdHqcfJPHX9Pr+2CIlgc
         rPibZHFB1dnNAFInqmdZ4N2j/BqI062dJXZ9/al+GlUdMTl/dPz6faSV/yXu0HAOeC7m
         +bqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnZ+hn6l6fXjITvl+f8U8dHV9vhTUrdotIm1ZRwz8RSHFBu8AAgxxjhwtQKhKdSWumMO8Xd9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLqHJGz7Ff3lqvxEYz577Chj8pMS+u5+qSLYF0QxBm/0OFLFjR
	+aMqdRO9P+xsMxYEEuc4GFcPKFZlW4JTecFhffKQsCc5Aqs8ks6N7jU5
X-Gm-Gg: ASbGnctPyfvsX0t2ovQrlNnisxfqAORRZkwQt1agd6bxsCNJplefDDN7s/1yaoN7S8N
	LF0DbxAJShN8NaeDqwaBYLdFynBvpZ0EF5NawEFDqiUw1RQKm/9LPjbXCQjI4c1YI2k3+O/zobN
	PuWDEeGekmAxRDPfcsdu0JJSh607HFsx6RNf6EqcUGEKVtv0h0AafdIUr1K0wX+xgA6gD80WlL5
	pm2bFF8Be2Vp3z3L1sCFNcbRSARzF33XsZ4BgxgnSqt25s5ZlEg8SnVwC3wArTJ11XlTqsvLXfR
	gtCtzsLYhSuDtuXO8kqTJsxLAI2t4z7bAgBOozEoVyRnERibUYmhvJ9Ul616UJZnuOlzdnXj
X-Google-Smtp-Source: AGHT+IFxKKprEgj0UFVm9wh0Cpkbq08sPxFBqdL/D1NtTk0oMZTwt0KwJTTh07EjdB+QJCVwDh4pZQ==
X-Received: by 2002:a05:6a00:170b:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-7490d75a080mr14587231b3a.13.1750638658187;
        Sun, 22 Jun 2025 17:30:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a628108sm6888755b3a.102.2025.06.22.17.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:30:57 -0700 (PDT)
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
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Mon, 23 Jun 2025 08:30:42 +0800
Message-ID: <20250623003049.574821-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Add ethernet configuration for Huashan Pi

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  71 +++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  10 ++
 3 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: c9564e611005b80c0981ad174d42df14fb918c18
prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
--
2.50.0

