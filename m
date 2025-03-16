Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831471DA31F;
	Sun, 16 Mar 2025 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151413; cv=none; b=NBMPSP9e6EV7/UGvntEoCSAURwOZ6Qbh8yKjOoFcE3mgZM329OS38TM5aq3ymGApEfNyMrNecWgpkUWbCLAFt39NC6DhSjgN5NEWbVb8Js9RLF/OYkD0dBXbjItZsNwoz9J2icqiFUmlUr6GM6UJiklXuKEN66nsV/t+jZuY5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151413; c=relaxed/simple;
	bh=X0fjjZ/L5GK/kteVD4gJY36Hx8xP0KlfE2Bq6S2LLzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoRlQiWMJUukwSUVWUUvADBVV05hOe8kBNVOhQKXOSVamMfV7/229BgRjYrNQiV1cobkqHZjDNimlw144/EvUow6twXLb6SPmG8H3icCJNFniuLK7plIqbsjFKz8TVMwlSmPtaDtz3CfSd23skVeFdGIhNG6a8U/utvuiFcNlvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=br7LD4nx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="br7LD4nx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f403edb4eso2009068f8f.3;
        Sun, 16 Mar 2025 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151410; x=1742756210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ileqFVBRvtJdVr8tErJr7A3nzPzqi0Kezboo4Q441CI=;
        b=br7LD4nxsBVfj7yovkFEpF7IY9hIFtGTpsU7JZjUzr8L3CUfC2umjaiNYu7TtBndcP
         6QZ8UGNVcFSy7je7OzZHcB+DnMBhZ+AWmD3SU24lrHWJiArB8RrUFq4b876sGAOcQx5u
         ds1EQakwR3MKXfUgsMmWWp4K4ishFyOjK8V2ny0fuLeRMuBQ3ulzxbp6Qb8qEpLysitd
         4+FVvaM9krunjOxKQ8493CUCDjlC+FZX5tKQ6Ntm2cYpSGslm01IB8JEm8i6xnxF9gs4
         jMt0uDMMZ95sMAUNwYvH2mZ0DdxD2NC++iaHo4gnxVmscczxaGzhCYFf0BiOUS+34R90
         j40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151410; x=1742756210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ileqFVBRvtJdVr8tErJr7A3nzPzqi0Kezboo4Q441CI=;
        b=eA0OjZJQgkgtmaZ75gbJBfJPEj1OgXoWEL6rmKlY8sfTNpNnbByP0G9lRDnPjU1Q0r
         Skdd78qR13hZg2lFF3u2ZYOTn49RRv4cchwG0AKVOZctOlJTZkteN/lg8MRfLtpg0jXK
         D8Ya3aObKFaaFTt/8fem8bs9/4gT7NaZVRFEmpg5y57H2/08coqBJ3bIj+sWy/G8kFyR
         aV9s1uOvabQVDgzK2Uzn/kjAjjC4DOnOyd+8fAveR7WH1w2hdHbxJM70Yj8CUOHVi8gV
         vdSqJrUAtg8AZNCRWqtnMU8lO11Ixsu3+E4qsHAhepUZVsFzq94+ttLdKXVROINyN5f8
         vDCg==
X-Forwarded-Encrypted: i=1; AJvYcCW8Y0WNHSKnrqDmDSAko1k/03yD9VtTnkZgzaFQuG8irYl5y/CS92kxp8hqnhu2KNLHwKM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1uiUoBLv7D1yrpsIbgggE2bmjndjIDuOiCmJp56r/GOaiZ0d0
	kT84s5g1LxlSyyamOaS3n2HGqMIsAvuRbc7RswLgRkslvU6BS0di3S9KyDOe
X-Gm-Gg: ASbGncsxNNlawot1oFH95/dOKYPr4xOv+tMLykC6aiETIK8wniaD36irQ3kbaF1dGjf
	XhcBzoDAcxhfBpHiKO40mceSmoqY6PsBxkA1Je2AWTc1PSmlE6kMY8cre6lJi9KrtyIii7NS4Az
	pGABFH+K3mAAXa+fQqbMeWqm67Z5cJCzx+KLAkOosIaUWj5m+uIxKzYoKz+J2YLviIXqXpYZYHB
	+DIX5A18IL9KOkmmbpzucGoJyImUhRMcySg+cbQRADtrhC1eoNW2nmq3/44mNrULElB+GXtAjcb
	6nblbAKMBcZf1xZFVADqsEfuKahLbYhWTVd/HaZyTD+TNxW9iNPqihLx9A==
X-Google-Smtp-Source: AGHT+IHJ26+oZrdKRblSpHUYREjiIopohAi7e4Zi8nHStB+4J8T3y+CCblGsR2BG4HwURzM96IZoaw==
X-Received: by 2002:a05:6000:18ac:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-3971d9f0e26mr10803759f8f.21.1742151409707;
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Sun, 16 Mar 2025 19:56:36 +0100
Message-ID: <20250316185640.3750873-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..af74bcc3c861 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1

