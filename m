Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98AB1946A0
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954817; cv=none; b=ovXZwTOxTYx2yqrOP+FF/VqgVHvLVecQCzD0olbmKX8TXb4P4huZ642kKkqEr57ymku1HE00yrExua8NxRCjl2ZHPxzGVJnXt7t7eTp8BBlZmvdYoSYbqsgxcOiI0omjN38jdRBK1e7q4C0B7X16W6Z6Hc4VGDMN5b5RgTcaj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954817; c=relaxed/simple;
	bh=DR9R3XunPL5phVZguwOyECoq4O8IMCWYj0R0VN53bBY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pRSAT0wQVIslUateXJdYzXGvTdhIO/awOuZQlHqBbRirNWMT8vJxv1MM8sVMGZuoVz5ZrXHMFQ296LcO26uN/Ke1nx4PSlH8nia2/fAtRUBf5/i+dBCojkU1HTOyRlFqwBp1PLLOo0gHdrvl/tmvIUlHksAhfSli2zCBzZN6hag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOhLirx0; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOhLirx0"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-74572fb94b3so490954a34.2
        for <sophgo@lists.linux.dev>; Wed, 03 Sep 2025 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954815; x=1757559615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU219JiYxB+UL7dKKMifccL2sg9lhUG+NSi9MilUC4=;
        b=iOhLirx0M09wx3HkfYUQynOXywiHYH8TayWoZ3/9ZfsxI/QYEJpURTzbdhH0WLLTjH
         SoMyCZEyYHAYvi6RJfYzm8BFnGNst8f5suwcUSVPWss8GsAUpPO51HkKAfnv1irAVg4H
         igL79O4O4h0oQ+wW5O4hC+og2oVPCiFIqIbsZF6u4ToDlrYlRUqJlSjwSygPYqUFt/MU
         U/nXNsjQfAsH4Iex2lfyXxXV//2SUexzQe1UTtN9YNmSZs3V8w270wRuxyoFYaaVr6rJ
         0VoqUJ+6cZ/of1pPrwcNjrYUNM7C5daVQyE6y7DklXeYWh9eqCf2tAkI7Lu7x3f+VzLg
         b52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954815; x=1757559615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU219JiYxB+UL7dKKMifccL2sg9lhUG+NSi9MilUC4=;
        b=OJUaW3iH/GTWkKxYNun9Y2dh01ylFShXPy8nJ1agKT4olxsyEQ4dvZzKs55FqS3J7K
         4H2frCZQE5mb9CM+ADL+J9ekYtw22D/lCvd31eDNnvIzDajoHi2DB0fGPm7xMClrf0VW
         YDUuzOwbyDqcLx6oz46mp9Rlo5xszZYvT+GduOpSzOSjkY5CsdiMzyk70Pb0HPIy6RRu
         mcK5T4WNdqhRaZCcfW3UJBsRnltooxioy0ZtQBNOTv/JAMYEDFORXq9qyOurKVNNe5/4
         9jxfnKlmDo19uMsx1ZsfMixc5tx564280LsoFIqIIbqKUdaK8/iyfbTlVPhiQMVUmLZt
         pejA==
X-Forwarded-Encrypted: i=1; AJvYcCWL7SWE+JNXqyuJu6RN1NnQo/Ysy8lJctMDlMfVzdbqb8cCwn8txb++sD/swWIf1M2rER89tLs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7IipRMUByxu9d88KOe4xFAY9Qd4pG3T9U8Ex5DjjR9T4RgXs3
	rUPBBHRQazjHkO5rWOsVP14zR1UVuFoAMviSyFAQSVuA22XgnBiWlcws
X-Gm-Gg: ASbGnctDtThZw6+YF24e3Mw7oeLQFDh3tAaXcapjU+xRtlWFbVvhxpyFLIQ/6Pb38iH
	U1I5IIcG3WwzpEaZWGeOA69ykPlDDpdYoSrbhtsj0XfBzWk81gxRMe3eMKRXQ5iplSvQZlfVzrd
	OskU6FFxgG1jqKhwiUd8bB4phE8zx9umB3WHN9r1A9Qjc8o0W3T62PDWQsfEau3SjVtnmpQSbVb
	/b4n6l/KBMRUcGM+w4xZt7uUR2YRRpx3HJ38eW4LA6KVIKp5l0YfhEZIR3CMKVtdmjjJIKwjQc4
	38eRTHYDtnNjJBlMnjaxizTvlhLIYezX/CpY4s8ktPmj6MjBu3WohfRWRvlJ0XbR/51xNVp8dAy
	yx8sxeGfzwHibGdVhrOfTeXlQQ7DSez5I4UxVjX5ccws=
X-Google-Smtp-Source: AGHT+IFKeulPMsBsQALjUqa6sF2+AWk4bJt+0haQDiVNq0B22+NXV63rjkaWnjX7VtXX2WZpPqcF0w==
X-Received: by 2002:a05:6808:1b20:b0:438:3911:48a3 with SMTP id 5614622812f47-4383911506bmr1569553b6e.48.1756954814645;
        Wed, 03 Sep 2025 20:00:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4380007b0b6sm2262726b6e.25.2025.09.03.20.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:00:13 -0700 (PDT)
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
Subject: [PATCH v3 0/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Thu,  4 Sep 2025 11:00:06 +0800
Message-Id: <cover.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Read the device tree configuration and then use it to set the
interrupt type.

This patchset is based on irq/drivers branch of tip.

---

Changes in v3:
  Thers is no major change in this version. Just adjust the order of the patches
  to change the DTs first. Thanks to Thomas for the suggestion.

Changes in v2:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [2].

  Reverted the change to obtain params of "msi-ranges"; it's better not to
  assume the value of "#interrupt-cells" is 2, even though it's known to be
  the case. Thanks to Inochi for the comments.

Changes in v1:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1756169460.git.unicorn_wang@outlook.com/ [2]
---

Chen Wang (3):
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  irqchip/sg2042-msi: Set irq type according to DT configuration

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: d36bf356068cdb5499b9bc458db9149c0fd938a2
-- 
2.34.1

