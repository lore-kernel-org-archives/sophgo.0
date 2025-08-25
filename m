Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09628725D
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104879; cv=none; b=lL8xICDg+uUzPwwGlSp4qrNyGlfNkEknWD1YHeKWQb4YRNKYo3WDzkDMVD9qP0VqGccUlhPYDSdYBejpWwQv5/rbq6WQoyUHK+ynG+U4xPyhnmsvbgNqz4MaPYqd/0RaT7th2d8OsyHHSa62juG5Xrigt5c8qTq0EciR6R8YyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104879; c=relaxed/simple;
	bh=p0/ul3UeEcUz4h8vcB8yVSLHox3GIlZPeDNzcrMxymY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=M42rf7ihRXfr0vPsM2+eVSb6vGWBCCg2L+PYnM7aAqHmZEEhRP/PV2ilDOtlXCNV00WWe4Bc6y3px78P/8qXgb6wlJp/xJ5EvvwYA/nz5LFkCZPxMK1HTbOxASRnR0XbUrgaRSIdTPTYmdS8fq6xCq/Dn4wc0T2Z4hakozLp7rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abS3JMTo; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abS3JMTo"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74381f0664fso1113560a34.1
        for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104877; x=1756709677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjCk9K/9vMZWlVyVVNpjDms4LHQz7N1FEpHm6N3zn4E=;
        b=abS3JMToY5SWxNKWga8gsXWug1sib2i89iXBQY0IQlrW+VJ4cXC0usHdUA1lm+Y9bv
         NWKxluUudTg6G7Tn60jhJd83bYxFtz52Hc+plVetiGWWp6ZZZS4Eoz0vLUCaEm0sU9zY
         uCzXlKY7vo3RIB7ZhLu1fqYAlLMy/N567k8UD6n0gWBIBd2bfxRb9x0i55QbO6VYQg/l
         yF2NAryApdvEMeWDSKm73z7fbJTWnXu4zhKb+N2Ocha1zGDhdbGWIzcz82s0zn++8ykS
         ysI/iJ+oswCenQ6kGk7BImACIt2Mx1BttwiOWloH+AExo87oYuBxhTbrE7uYfK+3xfv8
         rd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104877; x=1756709677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjCk9K/9vMZWlVyVVNpjDms4LHQz7N1FEpHm6N3zn4E=;
        b=wc7lAL2nc9US7PYFRMY3ypfw/MpeVw1XA8+7x4i0tXIff5hwdQRJ8jqF3LU2SpU+tg
         2lPimRaA9wqZJSDxjs8ow5w+5/8LcofHVhMVn5kZMJaHX7f4vPFXImiFTWS35I5+m35I
         tq+P59KEqdlbKXl8K1BvFdlUdBK2nuQSB2HM6dr4r9aDIc3J0vn2ahe+Q8uSYzjqzXuh
         IOxnCw2oflumzL6YV2eUbHGdlbCZURPK6rxqg0cYO8VkqTIMX7JGjpM/DQ9awJjjMnrb
         0l5wY8ur97Y5JchG7WuOlrb1dFUTrjnvOwD/1uZ5HlzY4DUtAlTG7lJn8D4O126pgQnt
         7PgA==
X-Forwarded-Encrypted: i=1; AJvYcCVvH0bPmJwkn7gLcagMwjAKPDb7fCX3dYhV3Kn6AhiCtdBCIMa8xm3YQP2BLZ3H90QzLbAZs7I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze+JJ/8FDiBpM2H4zCRWvYWvXD9hRovUO2z3leX6pdfGROx16m
	18huv1u/o6JZFjCCG6RySYHVUMGj9LRr6WIO4HjUjscICPhs8eU+OqkC
X-Gm-Gg: ASbGncuc8MzAJiOz1E0l5J53GQ7M9H0vrKcAJQZCQ4C+EeWb7/FVuLLpf5hXri14tMU
	Zn2/k7k96dmg1l4rx7GfnkZCoCluVTRGc6nPdjaF1R0i+v9xvzKOnpUt99rG+sH03dZKsxERYto
	HhjlicbpcyfMpZfZ0CR38U7kzLB5OJZemAKyBhc+V6m9rgQwhdnBB3PgthZ4+x1An10Dcj4c8cl
	lCvXgq9wPZaKtCMdcXTx8DPMD69CL1N0h1hZQ+3eRT7pMxPMMvAdM8avGkdLgwvp6C2oP4HWmgB
	Bc2nYNAGqwIm8BdkNMd0xN8NTkmAUoIpViGJmLF1Ijf9Ro31ZRFskcvbcffo1SmdHXwirYQdynl
	X774ahoIpx/R1VmNzs2JyWLSxivrcPCld
X-Google-Smtp-Source: AGHT+IHDP2qnmqjS+OjyuxLINGnH6RRIlWczknh6KUY3WAEc+CTBhXBDniv6qq7QdHd/r3GPOi1JPw==
X-Received: by 2002:a05:6830:6993:b0:741:c135:6afe with SMTP id 46e09a7af769-74500900005mr6184862a34.5.1756104876891;
        Sun, 24 Aug 2025 23:54:36 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745226acdfcsm433568a34.12.2025.08.24.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:54:35 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/4] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Mon, 25 Aug 2025 14:54:24 +0800
Message-Id: <cover.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

Also improve the code to obtain msi-ranges parameters in this patchset.

This patchset is based on irq/drivers branch of tip.

Chen Wang (4):
  irqchip/sg2042-msi: Improve the logic of obtaining msi-ranges
    parameters
  irqchip/sg2042-msi: Set irq type according to DT configuration
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING

 arch/riscv/boot/dts/sophgo/sg2042.dtsi |  2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi |  2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 21 ++++++++-------------
 3 files changed, 10 insertions(+), 15 deletions(-)


base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
-- 
2.34.1

