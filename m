Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4683644C5
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540928; cv=none; b=GJMhbfjrjLe3b+xVO/pittzaNqObKX2tjYPy10QvRa7oo0ve2nBe24ntjDOj/hXD4gzXQK/5gXbDG1NM7uiTZXtLcUN92Gj226DCY0jmPThjqNM3VOD+iYiyzFjQ0919533J1bj/fCv6TikLawJFE47zQP+Kutc7lfeseralmO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540928; c=relaxed/simple;
	bh=NJPV83aALQ0kqd42SvBkY3VtRID2IKOpShixJK7N2m0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=duFvrM0iLLdLQl1O6W8C2anuW8sC2Aaa+HfhJRCZZwAoVdPPHGw2Gy43b/1iOZu4plJrZGTK2Jfrj4FimqcJQUfnwPgnINstEQ2ZRVgdEhkx+8hGh78ZQpXwVzhHCLdLHS6V1rQfhslhEVgcw8CNqUhY6MvTVsE4raizN8nakEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/NJvD/X; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/NJvD/X"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee0291921so52081915e9.3
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540920; x=1770145720; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=V/NJvD/XHu9dkwijdXIQ8sMzI/VlpepsaqOJvfxYnujzYtl+oHP3/xJUQ2O6JDcsEJ
         6f8h071O9VYyI1m+IbvRVIC218ohyTpa4vjTV0XYgRdAUD23lWHGr4I6xxxE3MLgoaqp
         6a61wzDXJRcHQsoIEweGHBYyKB0k3cTLTF+wKzNhX5OUHFgEWV9dek7BiKXaknARSBJ1
         1KdFOBAKgqjwnSt6t6HNIrdwLHJMJNnN45JtNhnlR+TqRt00IcQz9v/EmPW+ulaiIvl+
         85h2+wok8e5hmeSapg7/QTxxswvecOEAdQmDO0jd71FZ2hZ1JM2VDntbDngYE8yhDA43
         fi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540920; x=1770145720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=Z3BTHnKRF/YZ5HDqNXveqOcxHBvALgpKnCf/zNA7bS/HobX1YKfs0dVLOaMZkoY7Hc
         eTje7C9LNZ+dGA6QODzakMLU/TgliZsRLVSrWji9pK2DtaNV8DQEeJrS12IWvfF7JEuK
         qmNZVk0zlxkVSzWeIy0ecZbX/3iT46S2fqdeStkg+FLdcvU+peETeQ44aoEMZn8rnnXQ
         IUh0wYfeOZasJPRRkeiszcpnX/Ss3ScNkIeBnV09tEoRg0zmGuQWvCD/sKzsQG1Aeipc
         G5kqJLq/0HYgwHkSrKBzBdDeNpomZHW2fvg+PsfXGTgHfDbjxTumulewWG7McC2H907I
         LcBA==
X-Forwarded-Encrypted: i=1; AJvYcCWZippux4UkES3/TFHKNm7Z8odO2A6pFppl6fyIVjocf7q8PeuCjnAaf4APwyyxHAi96+zr2qY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3ocxUooR5EiSxG8hXlsdPplBXZVbIKvGvDP7bLrOJKajR08CC
	brbkwWb6WLKoY99+Rr71DAHlcldnWgcJOC0a0bN/dT8Hebkn4BkTaAMO
X-Gm-Gg: AZuq6aKvJ3uwOPo8Ir0U5JZBS9UygqvHNoS6yJVsWDob7vyNv2PLdzF/heN3G7NG8YQ
	ODBsb6k/mwTRL3jbyvQ7YPdwtR/v7duowwldBlYpOM3Fmf3w2aMPeVWsKtRrMURylO3Yp9/9KZy
	peW5II09YsoOyy4PhN0TnRCpQ1m+eKEvmOceRJoJzIlpv9kohKVkxuowC+QdpPrKHbmtYsWPk2E
	dxFmFCa9scLfOWzKXBZxnfwf7UTWPuRWukSRXv4z7Y45hrmQvApA1IA5NAjppmqIZKwqeRTq67f
	UQTovk5YR75QDMIWlEUKqZ+HQSAobLIketEDrV+HgAThPLVFvYVSTl8saJaiWErFnq4NaCuQee+
	9DDyQ7Ji3e7xLHkvq5osC2yOVhwOJ3O+PhMt2t6IWMbaH7vHp7eqvc7wobRVHslpkSQwUs/ld46
	9VIpLeVSA0utbznlgpy4otMMdmUB4h0MhI0cBrCozefDbU
X-Received: by 2002:a05:600c:699b:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-48069c3f914mr33405045e9.8.1769540919784;
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v2 0/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Date: Tue, 27 Jan 2026 23:08:18 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACINeWkC/42NQQ6CMBBFr0K6dsy0GBRX3sOwKO0Ak0BrpqTRE
 O5u5QQu30v++5tKJExJ3atNCWVOHEMBc6qUm2wYCdgXVgZNg9pcgYMTWiisdoYhCrBJ4DOTQEu
 uQYtoeu9V2b+EBn4f7WdXeOK0RvkcV1n/7D/VrAHhUuv+hq1rauMf42J5Pru4qG7f9y+xnVTvw
 gAAAA==
X-Change-ID: 20260127-incremental-for-i2s-dvier-9ec60a002bdd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1049;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=NJPV83aALQ0kqd42SvBkY3VtRID2IKOpShixJK7N2m0=;
 b=BALvBEZkSNpptOqmEwB5MQtyO80EUcfyeXUyMbbmVZzVuUmopwgYKeiywgJJKQXQ00KP8BFtq
 7AqNTbv+MOoDiQh6P42kT3FpzcGOcasc24nWIxMoajEBf8soCo5aPTH
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

An incremental patch on top of 
"[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC" 
adding the explanatory comments as requested.
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/

changes: 
 - added description for cv1800b_dac_mute function
 - fixed "extra change" from previos commit

Thanks

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v2:
- missing Signed-off-by for the commit. 
- Link to v1: https://lore.kernel.org/r/20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com

---
Anton D. Stavinskii (2):
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

 sound/soc/sophgo/Kconfig             | 1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: bdc79da6c6206a12c9a13ed5e4eb1360d62b321e
change-id: 20260127-incremental-for-i2s-dvier-9ec60a002bdd

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

