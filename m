Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80724A047
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391966; cv=none; b=U19/GgiF/eg3IYPS2xdhAb4/eyioEvGugOM9aJ83+ecaKYKUZ0gKYXsqrhxWHrnp0VRyAPFR0tPBrNKwwHUnyz+4jGYpM5DcEh85PkAdV15FtQXwZ3ZpGb7fi+fekdsr9I79+n9CNys4hhx09ykac5ZjboZtHYdrYZfR+XSUx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391966; c=relaxed/simple;
	bh=9Bqo94YHiFiKkOBkFOEIOCxQ9JWo07gI933V6qyxAy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6CBEko06mAlySZ7EISsyV2A/3WQFttJe8VuztEHoLF+y2xcn7gze+a7T2PrZLi7a0XkB9PVRZD44Sl+qdHmdEe2HT7AuOFXq27CkoaQX8ZMfIGUdVAWHk+xfQ7w8cIAJ4kBwS68TRHGsxa2ixfk2lEeVcMmP+bskqByzVD5HAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5qmBg90; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5qmBg90"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220c92c857aso70397765ad.0
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391964; x=1740996764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPGO+zy6qEo7yGIQSUB6POZKOvKXrvFXwU9PL0lZRak=;
        b=N5qmBg90NKfN3QoPxbLMSvL4iHRldyiHxKwZZgvf+XEzP4epTqPjdDRWOJ9iZfdYPx
         GtXjniYvTLMhPqS6xfJphmRDSE7laE+q9x7ta+2brBWZrmrLhZ004qbcpawG2GkQsysG
         6wEBIuRW9Y02I4gGyfhFwsLKAH66svIDao2/GkceMNGVHCKXvUELqFNfyA15EFLQqa4u
         MZB5Kj2+gIcLuVA3ZtTzzVi8cQfIIQ5GjpUyw07zQWZ4RJMYqQ+rBlPMceCw/DjnKf5t
         pQH13S3YoWrXEhvuBnZKg7LXLK4drM3h044uu0qPeqlpd1X0jJn5oEttYa52iwz9Ec3p
         RoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391964; x=1740996764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPGO+zy6qEo7yGIQSUB6POZKOvKXrvFXwU9PL0lZRak=;
        b=Zkigem2n8+SHIjSAdeS1LRhkKTTgHC3ax2vHJ0GVfC1DOp5Qhu+QBvIPHXk5tgpyZc
         QQFnUjvGCcqpj9sXW8CrnxL1b5kcz4fT7GYy7gdr0zRteNxMCr5R/ypGn+XaMYfQBJk8
         k7VUUMNgoz+coZ870/anUopTftKvXetMRDJsWCEClnKOLhEJYtT2J04zuQjPw6o27cA9
         N4US/KH+OV9vpOBeMQp4YhnM4DFH7/nbUJfqaymw+/d3tPbUluclrKRcgg4kJWnJdbPt
         GD0di4D7tuhuZPZ/bNzlVbKwMSujLSurXc7luAEu9dVGutOd8ef5o8B26gA8dmh8YUNS
         +u1w==
X-Forwarded-Encrypted: i=1; AJvYcCXmlrUu3mVp3s9DDdYBSXD9FzVfrIGvCxmIAhN7oGjGIcyeiMAuxaybWLt3Q+F8FRZOEkeMXR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpjR3/TGWRCd6UGQ9WAlOHMC4Zn4jZ9wqRE8fAJc8/D2wI9lll
	PNFJZAmmnsv+Kbbv+SirsmNZltDW52bYq1LR2kxE0vcAV8JEdAZV
X-Gm-Gg: ASbGnctTDhqktxFMeQaEr6sfxILQkgLP/87f8pUPB3VIoFqiECXe+J4/9HjMK+L77TR
	0IXsi006okCgAE7VgKw0L0nIqT4zP77TFC46SGzIt3qPjKsqk3FClu8z617itAA7zWY5Q1tYvjI
	9wHQ5pJGKEV3NQmAuJp0KAiy0bHgKOBCOzPT7x+lwCpZSAFq9N55yx2EzYMZoDG58MMqvuhS1ed
	0h3kIeUb659eWuWYpvfhf33YejRXADVFX5MSG738lY8BcM6KyLTgJooUHD8Nebv7s3ZULd4D6um
	nlywAj2PEfaD1Xlt2BT+
X-Google-Smtp-Source: AGHT+IHjrhSY3sFSqcYVrgR3HWHG17PPt8fPA3aXE8o1SDs3Jub8Wamh6wMCeD3ZCxlYYk/Q13AOhA==
X-Received: by 2002:a17:902:cec1:b0:215:58be:3349 with SMTP id d9443c01a7336-2219ffa04dcmr239987545ad.14.1740391964148;
        Mon, 24 Feb 2025 02:12:44 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:12:43 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] spi: sophgo: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:11:59 +0800
Message-ID: <20250224101213.26003-1-looong.bin@gmail.com>
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

Longbin Li (3):
  dt-bindings: spi: add Sophgo SPI NOR controller driver
  spi: sophgo: add Sophgo SPI NOR controller driver
  riscv: dts: sophgo: add Sophgo SPI NOR controller driver

 .../bindings/spi/spi-sophgo-nor.yaml          |  52 ++
 .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  |  18 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  24 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-sophgo-nor.c                  | 501 ++++++++++++++++++
 6 files changed, 605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
 create mode 100644 drivers/spi/spi-sophgo-nor.c

--
2.48.1
