Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEFB78F37
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412553; cv=none; b=p/JIGK9SHZb1UeMuWOM/ufuJYmi7PdIGtW/fTUsMhhnexbwKIhkSmuqV9C+ZGWGW+/zTNCtAfzfIyKTG1nevJg0HQgzOszLn2KsUDIvQ3H5RIO+XWV3RxENDdVSx5N9hnOzh7hnaj2jKDE8WM2sKXeJhJa/YhvKs1g4Il5aOtEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412553; c=relaxed/simple;
	bh=r0linYsDVsAM0SiTnYEO5XVZWWBiYzYQ6MR5dJ/4NrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jTxtInfQuihZbFQ6HdvwL72O4o6pej6k2bS8QbEN9k0kBNHEhf6+bb6gDL244OlcF9rbWr8qVCFijLwk+9HsaE/d3tJXh3/ut7r6qO9LAsJNMQD+qjph/Xjev+oQV5gSogjha9avyf9yeWY7KzvyTMrgrlPY8dAI4Jq1ACF1p5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVTUXm7o; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVTUXm7o"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7be6fdeee35so71131085a.1
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 18:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412550; x=1740017350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=URu48V2H4PNPhJaMKw0EYRbAFViym7qaTk/OUPZaI/s=;
        b=EVTUXm7okzKCYhG9rl2j5EscVZpy/Pa22zQWy+UZjdazCA+slqpURkNHkXxfGlx0Kp
         xyHN6rv2nRW0EFXAhK8NJy6qYAzMLy7Mxe10poSvTIrdpzgzJj9lUrl0/atDFF6CQMiB
         VU0cEzzDOY2/Fap171Ddt6kmjX1JuLHtymNv2U+I71NAmfXvaNwXQ1k0u2RcL70jdfV0
         TIZodRUosQFMXQ1m1ieuL49/nbafc/uLvS3yyrM6sxrFL4yIM+k6qmVFMzajdgEoqPvT
         Q115s/NYqeZnt+FVSG4+wd6Zyws3s6nOxRKuBn1Z8PjPZo3GjENwec5HRQKlJ0CKPTmf
         JtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412550; x=1740017350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URu48V2H4PNPhJaMKw0EYRbAFViym7qaTk/OUPZaI/s=;
        b=fhbcahrIeenSLUYLaDUWCz+raC4kdWPcLUvhIZLgvLVi3P99mJT8TCE0Zdkl+IwA9k
         71TzayD1XgG5hAbGROaRZU+wPpKv6mPIw6UIOzmuak1JiijuDC1cxDQeIKUkFNbhjewq
         b/CpCliFOTjhN8ojyi/+auqPk9b8lS++L4URMnESe8tTvtggJ5/YmJPjj4LnMKJd61cv
         CJzZBXevshEjXx2tdRLa/SZpOWc8///hx99pf1E/1gVPLGWy595ZOHpXPe68L6aMYazK
         KhMKvAO9YtaLMusFbc9P1EWQtqw5lZ6VALx4EWQCuLFt0bH+24Go46RE5GL3UhgIg76F
         YULw==
X-Forwarded-Encrypted: i=1; AJvYcCWEa7yDBECSrUVu0BGlekUMzGoUnXIRm9m/GcVzg82lhHRsHowMgcPD4imnsxQFFwmDEcRZaRc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkH6LHLoUwniURyC9vFDVT0R4pKLIyi4hSXJ1ZcIcivz55hr96
	9Vq+nHfrXKDhNTxNMqcBBtmVGYmkMllDrQSgRJp9VO1yezYdv5VX
X-Gm-Gg: ASbGncuiMffHsjXuUf7xE3de+58NDsS37rYL2xo/Ro6c1RC98FoWZFYKRH9QVsFCmlw
	RDRsuh21Lhod2yQe/TwtNdlvvdg7lzQFuiTe9S7KdWUHZwPqx7L1EMSoQEnk1dz1hROgBX/sL/I
	MLEC5tmNU8Vv7f93kbC14HtMld8Oa2Eypx1yiGl6qz+k6jf7jJuzlm1ej6NvbPYaFSwk8NbNsYL
	F1yo4gIiITDXMVHTqMSY2nvpYynoSxuCd/LS9dgZBLogot6QVjMnTrryNCuCIsbFJI=
X-Google-Smtp-Source: AGHT+IH7YLtKs3/ajC+qpgE3wdkNhgU+qso0fMS2oyCZoq3c2WmsR86YSkwyQWYRtESSNpuvD15H9w==
X-Received: by 2002:a05:620a:45ab:b0:7c0:724a:c4dc with SMTP id af79cd13be357-7c07a1ed35fmr341178985a.48.1739412550545;
        Wed, 12 Feb 2025 18:09:10 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c5f35b2sm21730485a.11.2025.02.12.18.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:10 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] reset: introduct generic bit reset controller
Date: Thu, 13 Feb 2025 10:08:53 +0800
Message-ID: <20250213020900.745551-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many SoC have a simple reset controller with toggling bit to perform
assert/deassert. It is annoyed to add compatiable for each device when
coming a new SoC. It is necessary to introduct a generic device to
simplify these things.

Add a simple generic bit reset controller, and migrate the Sophgo
SG2042 reset controller as an example.

Inochi Amaoto (4):
  dt-bindings: reset: add generic bit reset controller
  reset: simple: add support generic reset-simple device
  dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
  riscv: dts: sg2042: Adapt reset generator for new binding

 .../bindings/reset/reset-simple.yaml          | 46 +++++++++++++++++++
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 --------------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  2 +-
 drivers/reset/reset-simple.c                  |  3 ++
 4 files changed, 50 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

--
2.48.1

