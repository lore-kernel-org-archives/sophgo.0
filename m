Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01858126C03
	for <sophgo@lists.linux.dev>; Mon, 28 Apr 2025 01:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804153; cv=none; b=Ot5pYO8u6fIdh3c5phl/0+dsKgvAJ34SCIf6NXaH4ifhv/Csle77N7kDuhT3QvBtUOCzNltJmudwSemEFHI0OuW4gW9E65dc946tWTKznmh3A9Q+r6VqsNJy5DtcWl85n6FlsdyFnh00WnOkQd0Xt1SAUmR/aP61sDRjd1bfZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804153; c=relaxed/simple;
	bh=nl8UCthEODs1Hf2gbpKV5BOp54SO8pdO1m2vXfpbFIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnGxn3jLY4FnrlugmdgBfoANcWaiwKflkr9/ql1Jncn5xge7kH6j26umSFUqF0L41LpL/FRMO+xQDa5m6T8hcxqlj6QKd2kAfxpLmjk6x+1PNn83PP1Rme+0I63sIc4MVlG38ERocvKALpQc4Ghe8LgKdIUbhOq7aYy93YaU668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSR8dcj3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSR8dcj3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301302a328bso6027242a91.2
        for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804151; x=1746408951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CelbDdjD31eK+tW6nqnssONRY/dMWhFNI8vW3XTn2HE=;
        b=GSR8dcj3gwhOx6tulf37qbEXFPFNk7lHzE+JK338W4JDZieetsuXNJNxjwwp6qiPfN
         6fviTC5xS3HZ27zIpnzO6bg8AiamPBTgddb6CmWyK3QKIGMz7dd2yuBFJtQE4pn5YQZT
         cdxIrpJLnSRuHRujiptYyLEqFGqRVXbbQVsKbEZkW5Mm0HuQxN1mwVCGPOxZ+GPJOMbp
         kqZrGP3509hnEt4QfVUTvvCxMuXhBzmhy9XLOo5FDgiBzbLpiAx6DtHEychWtQHhicGP
         NgXuoxd+dIn84K2rQC0rajL48+6wTREUqrmKaFiKh9sgky4nGl5FOpZ7Ituj1Ih3KQZj
         FT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804151; x=1746408951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CelbDdjD31eK+tW6nqnssONRY/dMWhFNI8vW3XTn2HE=;
        b=TVf+GtgP/Ohq2LowCqfruGdZqDR8QSjOioViVPNAoSWoWlvpxWkorf6HkeKVHrjFSw
         BnDp1RPPzw5vudBJFcPsEnfVEd26jst431ypsUiSz9P4XU6Qm+XkfF+ydCm8GD6Vqjz6
         BhJD1d8HL7px3dKQDXEydV2OMxHFnADMmcxGTaAHpOTrjr2k4PJ5+haEOCO1dj6vZZbJ
         7e/60U/hCsmsYfnR9RZoMi32fDh5OByJGlcxJOFNV0FRQMr8z3+UKMUKxvB8lmGeYCs0
         Bi7pjETMVsMddA2swFS52SgEre3rqzbOG+BQe1+k7u4/DGY42mblqxIvnqhN/OwNxB7F
         6t9A==
X-Forwarded-Encrypted: i=1; AJvYcCW0/D0IhnnT5pwEnmmgeulcZEVoY+byFk2yHt00rTsSArhvhj64iI9nFGLQgyqPXNi3X2AnFVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOZupfmNlaao/FegrhtgSBaXMsFKluyX7JjQOy6/+Movs9hZHt
	EH5O4R1hxQkBj7cVmZwt7ypZEHlbEftdn5Wz0S83tMHo8ISR8qFh
X-Gm-Gg: ASbGncvdps5LuBv70Nzm9W2ZnTWVqV3Cups4Cey6mfIfeyjBx+pMe6UI8pE1qj42v0V
	cuubcxkW6lW+n60cV6EAHE7jxsp9dgz4Pof5WybMbwjE89xLULOe2aic10KDy1B2tVl5AoT3szV
	nz2ET5HQ3kRcDv6trX1meTOsCe7aXUxjtq5iTuv7pobIWs4mcIEwdtx+66nV3CIrcC9MOsadZvl
	2v+Wl7cEcLqBbYRSv2/+PRUEuI9rLsO3x8/VX8ebzXSiqb1KWerMpVCI9SrXlH9GIUl6NzfZsOd
	h8v960/euyw+
X-Google-Smtp-Source: AGHT+IGKGbMil6EEDHU+0biwSVoCuulWB7ClFkZPInygmRDwy/3+427P9i1C7j/ysX93h0Q5LbcJwA==
X-Received: by 2002:a17:90b:52c7:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-309f7ec20famr16886974a91.33.1745804151055;
        Sun, 27 Apr 2025 18:35:51 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:35:50 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Mon, 28 Apr 2025 09:34:47 +0800
Message-ID: <20250428013501.6354-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v4:

  - add tags for mail.

Changes in v3:
  You can simply review or test the patches at the link [3].

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
Link: https://lore.kernel.org/linux-riscv/20250424012335.6246-1-looong.bin@gmail.com/ [3]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0
