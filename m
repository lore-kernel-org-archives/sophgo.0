Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426732566F5;
	Thu, 12 Jun 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734922; cv=none; b=PGb0KUU3AjWmf67RSH0L35w8zp6ZiBIxrCpfFyoidXkVs+qbyPT/4WSQDchA6TCi4pkoVZPWZ1Ynpj3g7/Q1rTPZyfGBgxodYA0OI2yLxVv9d6GE2M6ydpTNLmqNFDbKlMuTiVjjfgjG+IaTcQGW1EScnziEo7Obpf7+oE1872Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734922; c=relaxed/simple;
	bh=z8TUXJr5QsqnYYZqY2zibHKBXHeJjmjKYYu3RcdvDME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dI5NN8xGPt9cJ5Ce8ywGCybPsiNjDmRUIVMxIH4mZ3nyQFA8rLP1hx+19c2g1R9J6StuN2vEmeDZaGyapqtXgHclrZlvOM7Zw74o8x1b9b5HeQE1nevG3E5bEZcNyIRraaPQ3VaHDpfgSkjaRU4wxQJJ0jCfY6epmMDmOLx5Xwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQO3ankB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQO3ankB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so8144965e9.1;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734918; x=1750339718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=UQO3ankBa0uqr6p+7AzfPsvsD1mMR/tJSXUvZaZkQTUgMMnMQ0Surzlrz4pQfxE2VC
         xEiFZ7V8XUXVx1/Az7itFshizPRpnUhXB9DhkPu304Nbjy36gSxnMqwyHK0cgUDmSiGL
         9w4yJTGsh2T9RFG6RzwKIv3mUcNG2pz4E8zRlHh/6wR0AHJ9kGu+CNZ3sQjhjoRn7Rks
         Ra1RZhczIqzFS3jx42mOZFxSrszqlSWsdRIAazlmJwV8K/RpK2y/sRLeDhvJKjZV9+x1
         lzVbU2XRz+vNucY/5LtXjGHfLf7GsvVV255Nx1qTXgj59p0gS4eu4zhRHn2KExOVVkde
         LnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734918; x=1750339718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=GUOxIqe9plAeSzXaa8Wi7VgcbtYsu7eMyzCCZibkD2UdTAGPsWkxTD9ar8t/CUl74S
         zr2kVEP+ErgQdr25z8sNphdGGEQ+cBFAsge7RX82TCEFQ+UTgbM8JGleDnr/1gyW913S
         CBcnY7C8xwzUhJZWvkgvjXYIv8nV7wjVXKwZyC57oVqrQGG3hZWO+xfDQ9dbWsEWGW6F
         cfpl1MqcDLstnWhiTdJ7OCuPfQaSjqalyziHhdGdGHD1I96y12mVkdHUDIV/69dM3+pk
         LkuoLdNS615lOlHTeRZOhbFfGpp7EfZfFbmmu+fXLlVHqdHqYIG5tnmODRgmzzYl7v1Y
         p+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUBtlxjl472I3f2R+uL7xSnidzUtw5SsPEHzCL2sqHE2ZxqzMVLsYyUVMUZ841ao+3MT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW2AwZLV8EOJqTeDIehvtK0AjPOOjkw/iRo1N/nhKCaDj+HdwS
	E2mHnCNwzd8DQYGfH/Z+os6WM3zIH1zIxbPNdzXFUHYs1clZ+FCSFPh/8FZNXgdK1HM=
X-Gm-Gg: ASbGncucpM2PX36JjYe16B9QcM2oQmLnSOMzICULoepGpQFfa9uiMGmc0UIEBw18+ep
	v6glDWqzwTm4fj8W9iPRcFnbvhe2rgkVFd/8tyMZCoQoiEUTAjDAX36k/gA9DbZRn9AIu4ZEqZn
	Yp/fWuTP3I8aqdQ5R+RIbd6+Nb6nKrCj7nWf+XyKO8mcnyBoK+7asCtLGhRQvZKjs7NS6NperoV
	6k5QufC21CNhA+6h2WOp8rHStjNwmR6G380AGMfrNkW67Fp1PkE25CgQCQl0sTGZqeT9yMIraEe
	DzqQvVQvssMH3Wj9FKi7kaoZYESehNCG3lGemWujkqHx4R4uRqrP7TVU8wVgeQqDd8JNMjAMApk
	=
X-Google-Smtp-Source: AGHT+IHV6e6anEHK29lgBtoS3Bqax2FI793ZjT7balAPQMK3rYPdrVYTPT9jvAqFViLEp5FxmMolpA==
X-Received: by 2002:a5d:584f:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5613749e0mr2289648f8f.40.1749734918324;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
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
Subject: [PATCH v8 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Thu, 12 Jun 2025 15:28:13 +0200
Message-ID: <20250612132844.767216-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
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

