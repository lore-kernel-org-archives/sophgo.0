Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C21CAAC
	for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 01:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739324843; cv=none; b=mEblolzsO8hojfU75sF/dcg0A870INep4D3vKzwyaD0Nv6O0Mfd56pXV6IwwKENoVLqHuV8yjmxrESFu2+NhiCZH6h795qKipY+uo808oz83zGsgbk2R8Sw2v0t+llzLRc4ToSeLtIwyT/Xukcmt6TZIx2hwz/nGrWKiVO7SQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739324843; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hNMtOM+NoZNOZkn3KF+2K2KzNT8+MOkGcHOiX58U0fQGLFLlFJ/cPbAhhoGGhM98DCmTfcfZCDePfTWlS3ekunx+gvWytwVFLOCMWmYOKTYgam8J1WRqj/mnRTzTWhkTao9uP0vnMtgGXFtMKsiRLxNtTD9Yo0x/WPgFfm1J2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=ZvJ/E0Ki; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="ZvJ/E0Ki"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-545064389d3so3825194e87.0
        for <sophgo@lists.linux.dev>; Tue, 11 Feb 2025 17:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1739324838; x=1739929638; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=ZvJ/E0KirtbRVHX5BZkzws3YQw+n4n8g5r5Z1+Q88OZwUksJXQurbWRdMyoNL5tz9j
         TXzoK/FKUZevrta7kQ/ZulihDYWSX1t5zdIgFff5PzXvYZNazdLVhpWIkCLN4UfjDiV0
         XEJyAHr9e4BDFfm4qvQZ64Az94g2y1k+k1pyglxpypdsdLOgkMejRe5d1nBO7IqY+GND
         Rpdlyllxct3mkVjYdWAViXnoWlVH6kpw87GticKL3LcbGroQ7h9wjymlR+T7daJQRVRg
         qjB/OGFvHQfZxfWcSpmNI37j9RYOtKW5CijVbzlpMLkptXv4uSrrvTKskUoQlZxw7ViT
         UN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739324838; x=1739929638;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=Y4cBz3jP03e9iwVOtblRnqRjUUSG8cCpIA3H6Raqv6WSqiRFIfuV6zTHtYvY0tRDcn
         CVA1q0R6TbBYpOMdPqUBA7DqRfLAFZK3fepjdDwOBIvMePERy3TGwd82oM/JzVXplM6s
         wtScR3jJEk3oqD43W25HJA6TrJIZbhp4dVhMoEZgu/HruXJZqeIIvsal45Q2oBOTqKAT
         3YD57Fr64GylA1+CyYkwi6R28Ip6sw9k8dmrwIFMH2oQL+mwWtqlBCiGkV7vRQ6WWmUq
         ihfkwSWIsigfWLFBg/zYQU1mwpPdgNeQCTDQqg7u9Mcbid5u1rZLUfSPt3xC1bMGPdaW
         Q81g==
X-Gm-Message-State: AOJu0Yy/Sl3REiCrC31/fnFZaAbDoe3Litp1T7HWO2hTGw//qwwULLQw
	6sv7woWGM/OQV6a8EvvsUPApfp1iNOIQubZzIpBpF3a+fewnTZ7yG5P5L7nSP7xj/Ek6kTtU8Eu
	qey149f2xDVoWx6chp/PMg1gqk1BIfY7Fxw5zCdJGhvfhkU4ic+k=
X-Gm-Gg: ASbGncubh9oAXCNQqsoqcX4HRIFP0LDr+4B4iDucly1w8FH5vK4yF8qWl5J/8Qr5PF7
	3nhfYJtn+V73HDi/Xu3WMjgY61WKfsgCiFtTPoTaEpgd8jxx1Rx/wkTb0wnOagRlgP9LK2TMfZh
	zwFokgLHCQgw==
X-Google-Smtp-Source: AGHT+IEUldvEE7fsmienl/Mx/adz1EBYPToVW9qAol+uaFpZ2kuJIU08u/BqidUe7Qx6qktnGAjeq8QYytLC9ACATIU=
X-Received: by 2002:a05:6512:3c8e:b0:545:c7d:1791 with SMTP id
 2adb3069b0e04-54518168e3cmr293739e87.43.1739324837894; Tue, 11 Feb 2025
 17:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Wed, 12 Feb 2025 07:17:07 +0530
X-Gm-Features: AWEUYZltgUZs1JYOjanprmz-9mYA9cpRQpefRgH-zWk-9nKlM2DqwSXBqsiPKcU
Message-ID: <CAH=dH99Xz-jqyH37ARsmLipDpyiJjmvDmGARZRNiAJ1p8sBQug@mail.gmail.com>
Subject: Test Mail
To: sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
