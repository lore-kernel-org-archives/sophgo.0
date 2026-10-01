Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2452758D
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867692; cv=none; b=XjJX0pmCADBCxNwMRe8VPFGhGF456Yp0PGr/tJxVvkXUwbCiUBkSY10l3djBukJqEQN5tHUF6F6ybllSZRSYpfoI8Ja3ZlFYJLxDEmJKHhFKFlKKvNU+/fZyr+KkN5wo+braF85foMaOCbxfACkWhfPM+Q0UoHFxUYWX8ajoHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867692; c=relaxed/simple;
	bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM0i4tBIvb2swoZGGOADWRv3/YDnH24b+B2WGNTl2Vh9W/ohT+VuPmDFmMy/7ZQ8xJgQT6HtT6qvcZ18/+x+zUe+Pc0z1PS+nldt45RcJZMRwGWxyso0eTCp322qg7uUgFZwVhHg50GAugKpYVktxrhjEntjPyzUKmBpxl7I4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxXMGPyg; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxXMGPyg"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so720521f8f.1
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867689; x=1791472489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=AxXMGPygiKxS0sxoNkWAayT26AIEn5p3AbPmg74GHZ1VOwbBP+tuCXkMDMlkZAAB6m
         O9/WtKZyMgLMp/IgqVCmYN41HSEikn95JyncmPP90H76QjAcmAaCRWd/L59R1Eh287lC
         7kFXACzaKJN5RLyeu5Wl0aA7eBLp1IWRLBqDFoD1SskZ4UntWfGN85yD6/V1iJbv9B4R
         YtRD20O05i1hbnUcdKGA/pirpf+k7PLKyAcH8Vq7NAa/y5lmBgt5Smiy8ehJ2iPxcjJn
         AbfCwCXKA7Ki8xEoqeWwC73LxIfst08jP0pN4Zx4VHvKnQw2jhucKXy8ua5i91/HasLO
         14LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867689; x=1791472489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=XBt/lGd02vWe+Tt1MMvH9Qfe+DtaMa97/R+LfWZ0m+C/zIsBu8cumjP2YHjNLbTP3W
         Za9oc9oEaB1vac/T9pvJI4ho3Pfcs0BJkRL/hHHEHcBR56zz8k6Qr/rB4C96sfPZoc6Y
         3t1DkjcS/0/pcMOmUlyGIc3QAGqiwg8WY/+3ACx3vKtAWHNWvPNg0Dq73FtfC30xvZ+O
         Lx8aV3HOOa2OWZmiTg4iOgrsEs4RC6JkiiGYJaugIN2aLL9+U5qyk7FRNnzvZuxx68Od
         vLFStsjPrvbobA2Z9l4Rd5ue96CNMmTn630ciT7KeeDJlVwqs8NUe6e041k5f1t+s/Cq
         Wzbw==
X-Forwarded-Encrypted: i=1; AKwUvBy207Ho0DjKEYLKH3zW/M4laJCrT3N9J2ngb/eOmmJeBe48AWKYQwlr2SU+NS+i4cqUqugLV6o=@lists.linux.dev
X-Gm-Message-State: AFq9FYIKzLJdSs+aGMdUzf1qq3HTN+Ntv2cd6EiQPeid6bapbWiOjYSx
	Ie01ngpNGxZvu45G77bZ7bqwo3pQ0j0NWSamsumXZf/VwQRs2v1n+s30
X-Gm-Gg: AYBFou0sMtqC4wU0RranoJBvqjImB4j1nUrnsu/Noq4Ae7KYRJPFzUGNUX4NRBI+vGA
	dXn7KiJ5eIjXRcivog7LayT4It5ZTE+W4/r+CHev0ZA2Scy3mUKUAyN8DSyeaOYpGqp+sKkLi9M
	Y8jSGIpJ40N+xK1Y9TTuokbENsOghBYKloYfQk0R08JOCmi7xO3WbT7kgYQHCgfByhNSjmLDrAH
	n/yd7y4i4nMZYfkPr+RpU3xxcwrdEI6l8pFRLJR3LB0ggnfLDuut8mvsTOqcEzs9k1kOWSp7HpW
	x+Ro0LRj5drLbmClrlI53eEvN9PzyRStBwufAI+InRdKRvJg4EvAVpsiFjAclO1WGLUYwuADH/G
	cYMYahYbBTTLQbyG9wgN/dFUWy7u7OFXsVVV06uSleZLLt8zS8ZdAVXgTYJAlY7qrTvos2cCRe/
	mLzMb3f+kQDN1rzb+rowSBsiOcJuUTcsNEjo0lz/vKJQwCG3SpoAkULaU0YoKNFPxP1EZZXMe0l
	rQaBXarYHoHZTWk70RcH/BS9tvjCVmGwbQ+wMLpMKkINZKesHAGZCVj4eNF71NLa3JSoVJrovnz
	4KdBFDr5bIOmSPx3PdXtJVlok74=
X-Received: by 2002:a05:6000:1ac7:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48b02544bf6mr9213320f8f.48.1790867688738;
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm3293500f8f.43.2026.10.01.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: hfranco@baylibre.com
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet 
Date: Thu,  1 Oct 2026 17:14:47 +0200
Message-ID: <20261001151447.12076-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hiago,

Please take a look at the patch [1] and the discussion.

Thank you!

1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/

Best regards,
Andrei Lalaev
