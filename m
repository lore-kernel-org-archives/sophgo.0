Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B451FBCA9
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077385; cv=none; b=ECcPbjP6JdGN/iY8eEX3oepAhVdEQ3mj73YdlAzYixycn1X7kwlOFojgwfN/rbY2W+vb8T0eBdqewkqrlVGDeE5e6ovoB69Ezctebi8Ax3G/rDgIP7StDi2ybgUO/WK+33r8qNdXwmdfRHsyI83LhMy7zBn4nBQHMfy3FVHS1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077385; c=relaxed/simple;
	bh=JlScFjY8QWH6alV3B7iC/P9dMhJjSb4OnuXww/4RGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIQQQ69l2Cei6YqsJ9NN81S8aD3swMuLtl9ePofsDcegBLFS8mSEvbDZdprauAGjBX5d2sUU1+X/767u+pGzL+ng8u4bu43yz9nfeorG8SivV/Cyqf2S/2zYkF8yZ+EoSRnbw+aDnBtX3IHHvm1yyucmlWPQ7m0tht9QzVE9vSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/snGrdT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/snGrdT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239f8646f6so44781185ad.2
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077383; x=1741682183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoXbxXKgyk87JlDdAMTtGXs2RE6Oglf8lNp5fJA+vrg=;
        b=P/snGrdTjfGgb1OfdtKFXSy6Ducc6G6pvn8F5lsS8y5Lhe6A1F7jeLXAaGYFSN8wz5
         CGRbMgwqltghyICFEyVvbM+0ToVXyWspsSgJnCR05jFcWKKWKzMojePsYFS9Gl6Nu8cC
         t/MrnzdMatqfar9WGQvhSogQYdMXmG2N9/49OLDfw3+nX7tzuDMxJoQU5YFuAVK5Maxc
         U+GrEBEbd/CY1czGpyMn6JfR6/2oJpSViIjbr/Vj1puJogRuWt5ZYlY/EVWKY5L5jEg+
         VWh+G3ZKpK8rmsJcljrLfHy/C33YGRiw4hhU0fqY8SYal9sNRkauQPU9IOboqVxufC1I
         M/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077383; x=1741682183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoXbxXKgyk87JlDdAMTtGXs2RE6Oglf8lNp5fJA+vrg=;
        b=Av651DEodR46BwpRP0aKQgQV0zZToY6nbSWcqe6y+6QSn+WNAbcC/cWsv1TqqsEiSn
         zCeC4EeQZHqbT984QiTTtyf3BArLymlT2xkjMQnPSCu5kv0rn9yYM5senZU/wXeetPkO
         5/Kfr/eAb4wqjYKYx6+/2J9Tutidn+UG6OdchBqBr6UIwvv3zLsbC5n7aL7IQ0J7P151
         /gU7Oqc6Uzevgn04A5nwvcXmx7wkUwx13Be7d2auKC9dLrexmb4K78YdLSmKNVqZd/AG
         FvpoUOoiFNaCvd1jxr0TBoMDZZW0P7WLXLGpJ8mCVB8fByR3ywXKK2dIyAPyJrvuQB1L
         qK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxB5xom3rrccU2X4vMjeTbsXAwXyjjTCbA7XMJvDm809GPpZRySNpWiu1VeIuZh5FVpm8Z9p0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoRD+fn4+73gz45TWobBmCet0vRgaDV6nDIUZCcj98kMNCEOce
	/N7lAwbsY0s/EPWMdsRBBkjzdBR+/V4/lviKJx57GabSqujFPSs3
X-Gm-Gg: ASbGncvrN0w3aXDDv8i0lEKvVSAc39UwYOXOmX+OEdeXPjb7ZC5lWByPrArI83d9v8c
	yOTRfmg9aVowfmIn03Gb5A4hDtXzSD0P3fTewPIZFoC2RQcrfs7W8R2kv5ioOiMwhpRDChgaztU
	trmYkfxGPZlWmXra+6/n75HRCcsrZEi1uFltl1pqtKegYBHuogCBAegr/uKoYvgnk5TPPLV6OJo
	1pgjgMYhWvwS6o2qRetsSz8gC35jWxKcMvU3FuSb0lyFdOhe8+cWOwSukmkQS6HuvyzADxe7q2+
	qJm4/xsZC/iQhAhkOAy1Bb/g60Rac5434MAoweI=
X-Google-Smtp-Source: AGHT+IHftL+KBeXBmrscPavFmNZrOosSLvGSCAflYbLbvZZUp4Q0oBIUi+ZQvunyvSVmM/kyQ7jFFA==
X-Received: by 2002:a17:902:d2cb:b0:223:6747:f82b with SMTP id d9443c01a7336-22368f7b57dmr221738015ad.13.1741077382988;
        Tue, 04 Mar 2025 00:36:22 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc3b7sm90597735ad.173.2025.03.04.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:22 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 0/2] spi: sophgo: add Sophgo SPI NOR controller driver
Date: Tue,  4 Mar 2025 16:35:41 +0800
Message-ID: <20250304083548.10101-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SPI NOR driver for Sophgo, including read, write operations.
This driver is only suitable for NOR flash.

---

Changes in v2:

  Fixed following issues as per comments from Yixun Lan, Chen Wang, Inochi Amaoto, thanks.

  - Replaced "sophgo" to "sg2044" to avoid conflicts with other drivers.
  - Improve driver code:
    - Improve coding style.
    - Removed the [PATCH 3/3] in previous submission that based on the baseline not submitted.
    - Added error handler to destroy mutex if probe fail.

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250224101213.26003-1-looong.bin@gmail.com/ [1]
---

Longbin Li (2):
  dt-bindings: spi: add SG2044 SPI NOR controller driver
  spi: sophgo: add SG2044 SPI NOR controller driver

 .../bindings/spi/spi-sg2044-nor.yaml          |  52 ++
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-sg2044-nor.c                  | 500 ++++++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
 create mode 100644 drivers/spi/spi-sg2044-nor.c

--
2.48.1
