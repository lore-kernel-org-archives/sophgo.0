Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433F22F77E;
	Mon,  9 Jun 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512517; cv=none; b=R0J82x9gOVKOJn4zU0uNg7vIcYfKH1+YSfLPY1cB3XLc1fwcD9Qfp/SjgrqR9L+ELJ1AlxK/tUeiLtx5Ord5Rj9lIsAxR3rwb0PQLG3Pul+CQ3CqWUg8JMYy2VgSBkwg/2/F0Muuo9KI2NoMsS6uYZls7ebFx6HH17CKIVCHQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512517; c=relaxed/simple;
	bh=qmujCDQlx9R4vpIX4LhEDjpBMWa2asx7kRQoNdgHhZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6Bb8azlZkz+P530mFkzrRrb0whwxrI56yK6RhNprGEuY2LmAtBBQPhxsDVDfueWyQQBkmzX4ROw4VWWWrjgMlTwZOVedVweagZfLldGz8aNjA5zcZDE/L6tS3mo6PFbXMew094UOgSFmtYBsx4TQL8ZBggCUC9y3N31Qaeve7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkU2hAhx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkU2hAhx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2697433f8f.2;
        Mon, 09 Jun 2025 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512514; x=1750117314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=hkU2hAhxG9pncapuNVhk7zmSYCwehK5bt73x/eIvRsGaKwTTXOlaiTnpQTajAnNQHC
         U1kwY0GM4xNYhMooEUtKX3cLWzSuSTBD2d3NobKqPHZnglv03ZqrTu6RopVpLbLhJ4M1
         FltyzXbs7nRySCdEsiDm0z2pWfX3o7zty8/EJJM6z7mWeaz9iqSWKbUr/8ewt6bjVLfm
         keCgamYHkxzQ4AtskTSulDCnCkk7swqjJyBXLccL21e6DsxYtJzfdC24hzWnxHKI+IcW
         GqR0929khKKbkzRCe//B6M1Cj/EUemxPNb8zPzi6aROdda7hLlFMk2YM8uZwoB0PeMlO
         DwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512514; x=1750117314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=iFKHwBdQ9WPfHKnxXS5OM7BcELD1vuixr05Ohx2Aky1NQ35WSLPnXMBn02Ocd43v0D
         TwVDZqh0LJucURjehOOzsZnmhS+DiLQt61noEiKwZzjpGGDpUuBTpgujL+iioUeLzE3c
         vTB5rFC4MPHTkl/soxk4E1+Dqff27xLuNehbaBfMGAp78zHxmqMq0JIWPQrff3wUT7j/
         9/TrBd1YI5y5gMYnLqi36Tv2hTH4dgoEarHWpYKeojkJ+y3knjhmcvjI6IfRhHmlh6P+
         K0RBR+qGWvwZs3lUvkgSS3X6eMVTRMKUY1NMtGvpSZWV60a+VmPczG5sH666zrRL8Iem
         WqXA==
X-Forwarded-Encrypted: i=1; AJvYcCVGlKb0lkGGpojfzAMuaMlA/BMhSYBYPCD4yGmoAbHLHJHHzAuvgN8tzOqyhAS+hvAgC78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo2Am+JHPwNQJZxLb7HLk2R1al7UcvRNTRFNhXcr3icX6W6fky
	iX5nDyGgdXowtDl+dzb7TLII+X4h9OqEK8JI1220STO9C8YyjGwBka/HSdMOvpetDBQ=
X-Gm-Gg: ASbGncvMF1L9ozLekHu6dWRGLwzdFV2+PpvLSNJYMsGkLnovIbK6Yjs2wam/EoQoX8S
	73Y1AZxd4POl0yEN+X0KW+dyZo++TGl12Cm5BbWB0oWisdwGXpx7GBCS6zC4fqwjV02CvVRYu6B
	WwFv32feTvwAQ+IDZ1GHSAaa4rzYAFA7lMI4FHpj8fxRA4e7Qy3Aty0h7V3l4OD2pkhFgDJy1w8
	1guffne0CdTMMR4M4ghuWlCgIOb/ozlko4knGDr/oByoKNj31I2JNku9fm2HhCwmv13YG3S9RC+
	6AB3lGf6KkTUm9De0k+Q3v3xgbNVzQVkPbTkfGUEOOOw5K6CRy4E6XkDaWo6sBNO8/6Nyx0bC0Q
	=
X-Google-Smtp-Source: AGHT+IHG+23gSY7lbz1gITYGdcTpMahA14EmzL8S35xxT7RAijs9v4mF7qIfd+85zAEt9lbZCMJf7Q==
X-Received: by 2002:a05:6000:18ab:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a531ce1809mr12878839f8f.46.1749512513652;
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 01:41:16 +0200
Message-ID: <20250609234125.722923-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
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
2.49.0

