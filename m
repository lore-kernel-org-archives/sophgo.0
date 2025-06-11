Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368D238D53
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630365; cv=none; b=IRh4zXWDqME/FQtFPAJ7beezJDFhb0m/+MZRhxGmDf5QzjLhx63S0B9f70GDpC65NS22gxv+29tR+PDG4krTa507XHKDdyXvdBv49umaJ/oi4QhElgjiUvFQ2ve//bzeWoohMnzWLgMbfG2R5cT4ftVsh4+8DfRvNSJIzvqZ7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630365; c=relaxed/simple;
	bh=oHshKpS8U6n2biCwRD+WFd94TuWLzC8tz5YORyxSnOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlPE97fQlroEpUixooyIh2aYRJdRBpCSn+mtR6QzACjJov/MTssLStImtTAnQA3wWjc7GyMlhYHbqaVoyeMES9Kp/6AxGJMm/3AcQnAP1zNvAa60U6WZJpRYgDvzgmfvAIov3yZFF7NymiR573UQcG59bHN+XwFan0d1GsIrIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb36Cyya; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb36Cyya"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c597760323so655273885a.3
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630362; x=1750235162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=Mb36CyyaSwDRmk0eYmrckjjmWBylgYckqLBoLBcc1iJCq3HiTIQHj/ERsDVCCd6zPV
         E9UPhQ8yaAYyjwcgK9CY6u1Mhech48Xc4JqGcRx84TOizT2IGwpiy96DuomTV23BHTvd
         Q0I3zck5vC/7WsSeNT9REBgVf+SVbm4XQfPktRlv0swHABTOIJ6uiv66Mmqdlp2Ej1We
         c8vGblmkMX736bg/cn64D9VhfmadvnYeuwlS5Bnm3Klr/VVxg9Ey8QjCPewjoBV7tYCY
         90d/PrV6YVIx52MfmGnKkFHSM6C8g+jsRo1FqXVt52E7dJLlIm5i6GFZL2vRLboB/dHu
         Qoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630362; x=1750235162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=dnPOw/vXsAZQEBnCWIsUVafTRFFN8rzuNZfY3Udtc+0TUw29KULcjUAh1MDQNtGPc0
         oPo/gkQ26jHSJnVxzQrJEAAJNmXpZ1pP9Ap71WpL0S1DUGK6ObWbKR7AezBV3vWKvgF3
         6tNbKeel0FBWeE/FhkgBndjwRan4tMCI8Bnlwue1oFecQCsCxqd4lvp1tQlL1buQD0Fs
         DYyfcS4NLktNs4xP7lMbaV8xuyoZT67yv9QjS7x8qmPTtt6JnH4I85fiztHMsed3zlQM
         Fylggsc3bbORUVLTMgZT5oFURPGrxAawMZyy/9tO9UaOC9ruMcL4kjxc7vVv5g1PPZLT
         s0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmBxfS1u4KKrtIkR1MFkdIOxdcrDcj3PnbEwvUL7OB08duMxD0aHS9b1bNvKAJFTBYF+cZ8c4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo73+KeiKyamfMK3fmovvu5zEs3NO1OjmNrxHVUY5lIZHLT8DU
	BCR8CyBxW7BazTOZT0svu4zyvSuaKY1SrWea+aB9GviOo9NKD7a6YGxO/ACmKeXq
X-Gm-Gg: ASbGnctojXdSyBvLEz2ov5wp/8xJlILpeebk7KjMr6q91XPFKARJZr6xoGyPIZgu+9k
	TnGpXSuJeGA+bEy5mnGBfSdNCuXEKgOuwGFUBfrz9vb2929h5YKNNVcKybjSZw1T4VrgFS7Nrh6
	KC5qvkxCw8f3N2MELu7QdLmrkzhUW4rC5UlxC4YELVeJ5BkSX1N6o0z+k9Lc2s3tdbIT65RRI3m
	GiWCqmsaRCc0LgUH/I+/AtYc4sQ79CUq0CqlST4zB9Y6CluO7+yw8hDBGWI3z83Z35L+QwFgnu3
	UQy8b4DwWZXj1fwje0/1z1USigNkN9GbO3iUaVXIXPvlNr9s
X-Google-Smtp-Source: AGHT+IEwaN4dBdPQ+NDYVxNKaVab4sJPvqdTUOFH7bLWBppsyFBAN2TwbbXkYP0gjhdzUVTSukz4sQ==
X-Received: by 2002:a05:620a:3904:b0:7cd:3b02:b6e4 with SMTP id af79cd13be357-7d3a8806020mr398355185a.1.1749630362302;
        Wed, 11 Jun 2025 01:26:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2669b4444sm834084985a.105.2025.06.11.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Wed, 11 Jun 2025 16:24:48 +0800
Message-ID: <20250611082452.1218817-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon device bindings related DTS change for CV1800.

The patch required the following 3 patch series.
1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com

Inochi Amaoto (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 40 +++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 ++
 3 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.49.0

