Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841091DE89A
	for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758994610; cv=none; b=hiaR5dTjp850M0eoAypMwCwpQD8+5Bw0SMqJkkDssAhtrRZ69edBork8ZFfvCAE02tfxheJ9DAk+V2Av4KZ6sc4eJ9v50LGQVdqJi77VLVImrhbGDcXUXb2e01JIw/QwsgzRZRlQWxDdG9SEVCFqnRP3Lzjw+UUMrRyAetbrZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758994610; c=relaxed/simple;
	bh=XF+APECUX9F0rvdCvp5Uds/TNmoRS4fjsm/tqEnUQD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVI8KDp3ACI4K5wnd8spoSeoBfiP0QyOPt7saA+5MzjXVjLEJPsQjasm+LjrwbJIBkB4TAw+/KNlHp0w8zy0zVT3yv22HGfpBE6qQjD3XXZnnyMGn3PdEYbw9O9Oq+XA8tbDiZTsfMlU4M+R01CDh2ZyjkfwFOCjgoqoNIcWnbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iASoLPJZ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iASoLPJZ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d6051afbfso32462187b3.2
        for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758994607; x=1759599407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbjnLuSMG8yw44v3Cfmga/MZCs0G/sV0E2m0ttu4jog=;
        b=iASoLPJZ+oIsOL+hChPe841StH7CV71FdcFXXlAybYyOX0Wcl5hMGqoOq/lik2B5e7
         6rCpTx6qS9V5Rk6yQ1+IPH3iQUazZHuf/j0tSWEkoMpXzUee8eMBj02jVIUuDxX+7272
         tH2bBIn5cN1sZwdSYHXJcrGdxx1qJbvPVb/7POrurywZ/pBmNboVJnVZzkaqK5u4zNg/
         XPM+Uj7235azqX5vQ9s8ZvI27Br1aDfXt/GCW+yk7HiXlZt4oyH8qc43DQOn1+bJTlK+
         xpiwyOr0Whq0RECbZ/Ft6aJKfO7pwijxFhcEEN0wvBPeLhfnNA++SXDOYoQ5YFni6ilQ
         cLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758994607; x=1759599407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbjnLuSMG8yw44v3Cfmga/MZCs0G/sV0E2m0ttu4jog=;
        b=iB+YGt6h34tRkM0ZBieeV2T563d26Zx3LsuzFcm15Y0dIz6EH4TDvvC1iuUE3Ye3qO
         7wPiwv3W8m6+1rNImZqQCIAo10Goa8QFCZvXfbmvcWnJvw9NMcKhLVxFp+vQAhCZQ6b2
         fVGmysu6geEsdKJgJeMXMMsEiReuo9DoZmQs/AmW5pqxDWXxMMSOGngiVrpU5SK2IRWS
         n4WcxqurJeM+pXa3UfAyaY0Ld60YDaRBiKndy+WKxl5PqYL4imgZBr7tQVQRWNF6zK6Y
         Wl+twPK6ALpW38/saXcUtCIzzBG0rpFN6D9sSlT7/vr/3ZJBbKxAjxF6wg9G3EYHgfUz
         A9NA==
X-Forwarded-Encrypted: i=1; AJvYcCURanrqW3shvBeiXAGFpqwhvhVmuGTJ+70lrE+h4qkT7IoaaGSDzrS+n82ZbD5e9JOjqFkzgE8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaV47qXq82BoIEjVjMkUOFh8D2Sb5hGehffy6gVvIt6Y9R34jD
	1bUNAMEYT5hy/X89Dgrzcwn9h/JB3cJRIZLnNNp217ltMBc4Ztd8n9YF
X-Gm-Gg: ASbGncsxwRBpwH5wi0Jvidt6pSf84qePkb51HMBm/fJp7XLOJTIG6xhfgTUtNHBem3Q
	0hdpFgU01MHrDsKE/hg8i5uynar/gHMsgpKhms3V/b+dSxs03d7KNChcjy1e+JpXvubO6G+HMaU
	rP5I5RS6LVkVQfXK+asoAuA6qCDgk65qG+k8DAcNUNEEX6reod3EyNZODasOCxUArBHzu6MU0eP
	/zYGMv7bXq55SMEtQfL3pq/pcXu8/t3J6Vwpcklqs284Cd8FElIrRYlnf7NP0rx2Eu9M91aLjsh
	ghb9X2IWsxpfv7aHVSyeZefhVkPZo6jHrzELzc7k12tqBaPI1s86aoHscPeAwyUCCGNX31SmnwA
	a
X-Google-Smtp-Source: AGHT+IEGcKO9QkTdCPSVULH6h3vDhccsiVZFl7VwP7XTGYSwXlANev1tcrw0B+/ELVgNxVhu49n3Vg==
X-Received: by 2002:a05:690e:d4c:b0:636:111b:a4c9 with SMTP id 956f58d0204a3-6361a745f42mr13438608d50.21.1758994607358;
        Sat, 27 Sep 2025 10:36:47 -0700 (PDT)
Received: from sleek ([2600:6c65:7f7f:fe0b::ec0])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d83csm1269716d50.11.2025.09.27.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 10:36:47 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/2] Add initial Milk-V Duo S board support
Date: Sat, 27 Sep 2025 13:36:17 -0400
Message-ID: <20250927173619.89768-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card. This is continued
work from Michael Opdenacker's v6 series on the ARM64 side.
I'm still working on confirming the RISCV side.

https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/

Patch produced against the "for-next" branch of the sophgo "linux" tree:
https://github.com/sophgo/linux.git

Joshua Milas (2):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support

 .../bindings/soc/sophgo/sophgo.yaml           |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

-- 
2.51.0

