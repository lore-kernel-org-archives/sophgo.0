Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57B2356B4
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628474; cv=none; b=pyVtUticFbfXsnt2sacoRn/iuHnQ/HZ+Dwm48K95ls6SRVxMRZGbMgBF+/MVXbeejyzkFj7rT8Sm3uWRRQx+3cIlgiQMcsZQz7vJ8hVE5kH3dqgid4pZPP9mM1zxhOR5JuvLwSNhK1b6BXwrEQk2hdcOPOQeJDtMyed9mYM4Ju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628474; c=relaxed/simple;
	bh=bCVbSVwSBYwY1otSjwDqL5GnRL1mK5EbHr8LxlhsFIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdflYyRC+vdBPJfmemo3CkIhkUymucavPxST/H2MW+GVqHhPyQmFtB1Rm7ZLqQYPkM2oDyAm4gdX7fB45Ma8S4k2hKhI0Xr9kfo9V2LAxG/PmCLBtES3gO9Srm4wVATd3nclIgCORNlUYpg4Scd5TPb1lukt7yLHSaghqpECRsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k89NF4Ak; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k89NF4Ak"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d3862646eeso218705585a.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628471; x=1750233271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFY1n8hKD7YHLP1kf7MxSpa9O55c6JB9hP3AwHqMzNA=;
        b=k89NF4Aka3UJSiQlUiQXFVhZsde3eFMdz0cJYKSQiX2WF3l4pgT6wgsh92L33G1Gb3
         lEPgIAFtewn6k4OJw0+GCgpCT4iGsp+EgNFThBYVS3n5K8Q2VTlC/yBKx7TR0c2ZKn65
         EJfEHVtKJZeFITd8NmY60V7ZCiKh/dKdTFdhZh+7kVlqMqZpfb8gBnr0Zio0PlBZj6fe
         ufvwUqxqA3O2EGnmIZfeWeFwmllm+bJw/4tFvBx8+vWwmbfFRG/vx8SkGKUrmMkh7aqx
         /qx7HTsgH2J19xpCsRE7v1UlxSzGAMyVw2WR2waUqryI2RDhv8Kw1APxzM+qhrWMpApk
         cbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628471; x=1750233271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFY1n8hKD7YHLP1kf7MxSpa9O55c6JB9hP3AwHqMzNA=;
        b=I8HYL1GxUxvlNEcbUZ7Jc38965T0q/xcK9tswhcvB16O0Z/7Y48tfPzA4s+YXWbvng
         8TrOJqdd+6YNHnbnxjL6LVyUL3rKWXSBNjURhMhsy276VeYJjeE939j2ukcYk0BpFC/y
         NkU+xBUyn3DdGxP4JmzL6y7Q0CuPaozUHR961doB6oUZbPsBjd735b4KP3/ETveCJmf/
         QYcL9pdbzZNoKR+hXE1bKyK6/HcI0rGxtBYYwsbRLRDJmpojSCqTw+kN93vR3JIBy+vs
         jJ9Vx9CBQLDM9NcXtp0CwBK6MpF/W5NzzBCOL3wfd6hBlSgqfCPOZZ3V46DG7xt4nSUu
         j+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5TlAPeA7LdIEFS/+Qm6vO/T/kZsBANJ5BmbH42NNAKDRk5HBea+1zpXHpbiBzpIMLPfEXDzc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ykSnACenEQ7eA0lfM95+dHbxIniH6PwU4gkwkejQWaD4Zq9e
	crTwmtEhGxGJIX+4PHjwDDiyz+q167k/CYgr3QCsJepoqzvGGVIvUFMj
X-Gm-Gg: ASbGncuHWVJICiKA69FzVvK3qWB6THTLi08SRw1CtS4fLf3glO+Pmx4Yf9BnSVt8QqQ
	pvnQFmH/LzZ54r304i+jJVklLtEEee/WejBMTo46QN4wrzP6SIDrxnx2EVG7F0BwVmJbcHk46/Q
	RB0YSzBSo2pAtRwBVqelUWOVYkskgiJxjybU8PObL2IF1NZxshD0ISwAAOkW0FGaSImrNI0UFeF
	95OhkCocQCNpd1b8lt4ImS7sY9CufrXSH3lQAKXJIhjbV3mCxNt/QV+HE9fNZwjYHBXIdQH0TqO
	Ly+sWRh9meetQ3EnMa5X9FymhxOi//Csuh/FGg==
X-Google-Smtp-Source: AGHT+IHiEq5NOVnzdI0MVOEGferuZ6sPEJIWdas7r5sxvl6GtQWSqqWA/YtBhGlgc6evDKBd2SnF9Q==
X-Received: by 2002:a05:620a:29c9:b0:7d3:9ecc:1bd2 with SMTP id af79cd13be357-7d3a8805fe9mr315815185a.10.1749628471424;
        Wed, 11 Jun 2025 00:54:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a609092sm825539885a.65.2025.06.11.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Wed, 11 Jun 2025 15:53:14 +0800
Message-ID: <20250611075321.1160973-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v2:
1. patch 3: fix wrong reset ID.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
3. patch 3: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0

